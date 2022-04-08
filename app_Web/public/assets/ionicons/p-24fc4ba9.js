var n = function () {
    (this.start = 0),
        (this.end = 0),
        (this.previous = null),
        (this.parent = null),
        (this.rules = null),
        (this.parsedCssText = ''),
        (this.cssText = ''),
        (this.atRule = !1),
        (this.type = 0),
        (this.keyframesName = ''),
        (this.selector = ''),
        (this.parsedSelector = '');
};
var t = { STYLE_RULE: 1, KEYFRAMES_RULE: 7, MEDIA_RULE: 4, MIXIN_RULE: 1e3 },
    r = '{',
    i = '}',
    u = {
        comments: /\/\*[^*]*\*+([^/*][^*]*\*+)*\//gim,
        port: /@import[^;]*;/gim,
        customProp: /(?:^[^;\-\s}]+)?--[^;{}]*?:[^{};]*?(?:[;\n]|$)/gim,
        mixinProp: /(?:^[^;\-\s}]+)?--[^;{}]*?:[^{};]*?{[^}]*?}(?:[;\n]|$)?/gim,
        mixinApply: /@apply\s*\(?[^);]*\)?\s*(?:[;\n]|$)?/gim,
        varApply: /[^;:]*?:[^;]*?var\([^;]*\)(?:[;\n]|$)?/gim,
        keyframesRule: /^@[^\s]*keyframes/,
        multipleSpaces: /\s+/g,
    },
    e = '--',
    o = '@media',
    f = '@';
function s(n, t, r) {
    n.lastIndex = 0;
    var i = t.substring(r).match(n);
    if (i) {
        var u = r + i.index;
        return { start: u, end: u + i[0].length };
    }
    return null;
}
var a = /\bvar\(/,
    c = /\B--[\w-]+\s*:/,
    v = /\/\*[^*]*\*+([^/*][^*]*\*+)*\//gim,
    h = /^[\t ]+\n/gm;
function l(n, t, r) {
    var i = (function (n, t) {
        var r = s(a, n, t);
        if (!r) return null;
        var i = (function (n, t) {
                for (var r = 0, i = t; i < n.length; i++) {
                    var u = n[i];
                    if ('(' === u) r++;
                    else if (')' === u && --r <= 0) return i + 1;
                }
                return i;
            })(n, r.start),
            u = n.substring(r.end, i - 1).split(','),
            e = u[0],
            o = u.slice(1);
        return { start: r.start, end: i, propName: e.trim(), fallback: o.length > 0 ? o.join(',').trim() : void 0 };
    })(n, r);
    if (!i) return t.push(n.substring(r, n.length)), n.length;
    var u = i.propName,
        e = null != i.fallback ? d(i.fallback) : void 0;
    return (
        t.push(n.substring(r, i.start), function (n) {
            return (function (n, t, r) {
                return n[t] ? n[t] : r ? m(r, n) : '';
            })(n, u, e);
        }),
        i.end
    );
}
function m(n, t) {
    for (var r = '', i = 0; i < n.length; i++) {
        var u = n[i];
        r += 'string' == typeof u ? u : u(t);
    }
    return r;
}
function p(n, t) {
    for (var r = !1, i = !1, u = t; u < n.length; u++) {
        var e = n[u];
        if (r) i && '"' === e && (r = !1), i || "'" !== e || (r = !1);
        else if ('"' === e) (r = !0), (i = !0);
        else if ("'" === e) (r = !0), (i = !1);
        else {
            if (';' === e) return u + 1;
            if ('}' === e) return u;
        }
    }
    return u;
}
function d(n) {
    var t = 0;
    n = (function (n) {
        for (var t = '', r = 0; ; ) {
            var i = s(c, n, r),
                u = i ? i.start : n.length;
            if (((t += n.substring(r, u)), !i)) break;
            r = p(n, u);
        }
        return t;
    })((n = n.replace(v, ''))).replace(h, '');
    for (var r = []; t < n.length; ) t = l(n, r, t);
    return r;
}
function y(n) {
    var t = {};
    n.forEach(function (n) {
        n.declarations.forEach(function (n) {
            t[n.prop] = n.value;
        });
    });
    for (
        var r = {},
            i = Object.entries(t),
            u = function () {
                var n = !1;
                if (
                    (i.forEach(function (t) {
                        var i = t[0],
                            u = m(t[1], r);
                        u !== r[i] && ((r[i] = u), (n = !0));
                    }),
                    !n)
                )
                    return 'break';
            },
            e = 0;
        e < 10 && 'break' !== u();
        e++
    );
    return r;
}
function g(n, r) {
    if ((void 0 === r && (r = 0), !n.rules)) return [];
    var i = [];
    return (
        n.rules
            .filter(function (n) {
                return n.type === t.STYLE_RULE;
            })
            .forEach(function (n) {
                var t = (function (n) {
                    for (var t, r = []; (t = w.exec(n.trim())); ) {
                        var i = b(t[2]),
                            u = i.value,
                            e = i.important;
                        r.push({ prop: t[1].trim(), value: d(u), important: e });
                    }
                    return r;
                })(n.cssText);
                t.length > 0 &&
                    n.parsedSelector.split(',').forEach(function (n) {
                        (n = n.trim()), i.push({ selector: n, declarations: t, specificity: 1, nu: r });
                    }),
                    r++;
            }),
        i
    );
}
var w = /(?:^|[;\s{]\s*)(--[\w-]*?)\s*:\s*(?:((?:'(?:\\'|.)*?'|"(?:\\"|.)*?"|\([^)]*?\)|[^};{])+)|\{([^}]*)\}(?:(?=[;\s}])|$))/gm;
function b(n) {
    var t = (n = n.replace(/\s+/gim, ' ').trim()).endsWith('!important');
    return t && (n = n.substr(0, n.length - 10).trim()), { value: n, important: t };
}
function E(n) {
    var t = [];
    return (
        n.forEach(function (n) {
            t.push.apply(t, n.selectors);
        }),
        t
    );
}
function k(s) {
    var a = (function (s) {
            return (function n(r, i) {
                var s = i.substring(r.start, r.end - 1);
                if (((r.parsedCssText = r.cssText = s.trim()), r.parent)) {
                    s = (s = (s = (function (n) {
                        return n.replace(/\\([0-9a-f]{1,6})\s/gi, function () {
                            for (var n = arguments[1], t = 6 - n.length; t--; ) n = '0' + n;
                            return '\\' + n;
                        });
                    })((s = i.substring(r.previous ? r.previous.end : r.parent.start, r.start - 1)))).replace(
                        u.multipleSpaces,
                        ' '
                    )).substring(s.lastIndexOf(';') + 1);
                    var a = (r.parsedSelector = r.selector = s.trim());
                    (r.atRule = 0 === a.indexOf(f)),
                        r.atRule
                            ? 0 === a.indexOf(o)
                                ? (r.type = t.MEDIA_RULE)
                                : a.match(u.keyframesRule) &&
                                  ((r.type = t.KEYFRAMES_RULE),
                                  (r.keyframesName = r.selector.split(u.multipleSpaces).pop()))
                            : (r.type = 0 === a.indexOf(e) ? t.MIXIN_RULE : t.STYLE_RULE);
                }
                var c = r.rules;
                if (c) for (var v = 0, h = c.length, l = void 0; v < h && (l = c[v]); v++) n(l, i);
                return r;
            })(
                (function (t) {
                    var u = new n();
                    (u.start = 0), (u.end = t.length);
                    for (var e = u, o = 0, f = t.length; o < f; o++)
                        if (t[o] === r) {
                            e.rules || (e.rules = []);
                            var s = e,
                                a = s.rules[s.rules.length - 1] || null;
                            ((e = new n()).start = o + 1), (e.parent = s), (e.previous = a), s.rules.push(e);
                        } else t[o] === i && ((e.end = o + 1), (e = e.parent || u));
                    return u;
                })(
                    (s = (function (n) {
                        return n.replace(u.comments, '').replace(u.port, '');
                    })(s))
                ),
                s
            );
        })(s),
        c = d(s);
    return { original: s, template: c, selectors: g(a), usesCssVars: c.length > 1 };
}
function M(n, t) {
    if (
        n.some(function (n) {
            return n.styleEl === t;
        })
    )
        return !1;
    var r = k(t.textContent);
    return (r.styleEl = t), n.push(r), !0;
}
function O(n) {
    var t = y(E(n));
    n.forEach(function (n) {
        n.usesCssVars && (n.styleEl.textContent = m(n.template, t));
    });
}
function R(n, t, r) {
    return (function (n, t, r) {
        return n.replace(RegExp(t, 'g'), r);
    })(n, '\\.' + t, '.' + r);
}
function A(n, t) {
    return Array.from(n.querySelectorAll('style:not([data-styles]):not([data-no-shim])'))
        .map(function (n) {
            return M(t, n);
        })
        .some(Boolean);
}
function L(n, t, r) {
    var i = r.href;
    return fetch(i)
        .then(function (n) {
            return n.text();
        })
        .then(function (u) {
            if (
                (function (n) {
                    return n.indexOf('var(') > -1 || $.test(n);
                })(u) &&
                r.parentNode
            ) {
                (function (n) {
                    return (j.lastIndex = 0), j.test(n);
                })(u) &&
                    (u = (function (n, t) {
                        var r = t.replace(/[^/]*$/, '');
                        return n.replace(j, function (n, t) {
                            return n.replace(t, r + t);
                        });
                    })(u, i));
                var e = n.createElement('style');
                e.setAttribute('data-styles', ''),
                    (e.textContent = u),
                    M(t, e),
                    r.parentNode.insertBefore(e, r),
                    r.remove();
            }
        })
        .catch(function (n) {
            console.error(n);
        });
}
var $ = /[\s;{]--[-a-zA-Z0-9]+\s*:/m,
    j = /url[\s]*\([\s]*['"]?(?!(?:https?|data)\:|\/)([^\'\"\)]*)[\s]*['"]?\)[\s]*/gim,
    P = (function () {
        function n(n, t) {
            (this.win = n),
                (this.doc = t),
                (this.count = 0),
                (this.hostStyleMap = new WeakMap()),
                (this.hostScopeMap = new WeakMap()),
                (this.globalScopes = []),
                (this.scopesMap = new Map()),
                (this.didInit = !1);
        }
        return (
            (n.prototype.i = function () {
                var n = this;
                return this.didInit || !this.win.requestAnimationFrame
                    ? Promise.resolve()
                    : ((this.didInit = !0),
                      new Promise(function (t) {
                          n.win.requestAnimationFrame(function () {
                              (function (n, t) {
                                  'undefined' != typeof MutationObserver &&
                                      new MutationObserver(function () {
                                          A(n, t) && O(t);
                                      }).observe(document.head, { childList: !0 });
                              })(n.doc, n.globalScopes),
                                  (function (n, t) {
                                      return (
                                          A(n, t),
                                          (function (n, t) {
                                              for (
                                                  var r = [],
                                                      i = n.querySelectorAll(
                                                          'link[rel="stylesheet"][href]:not([data-no-shim])'
                                                      ),
                                                      u = 0;
                                                  u < i.length;
                                                  u++
                                              )
                                                  r.push(L(n, t, i[u]));
                                              return Promise.all(r);
                                          })(n, t).then(function () {
                                              O(t);
                                          })
                                      );
                                  })(n.doc, n.globalScopes).then(function () {
                                      return t();
                                  });
                          });
                      }));
            }),
            (n.prototype.addLink = function (n) {
                var t = this;
                return L(this.doc, this.globalScopes, n).then(function () {
                    t.updateGlobal();
                });
            }),
            (n.prototype.addGlobalStyle = function (n) {
                M(this.globalScopes, n) && this.updateGlobal();
            }),
            (n.prototype.createHostStyle = function (n, t, r, i) {
                if (this.hostScopeMap.has(n)) throw Error('host style already created');
                var u = this.registerHostTemplate(r, t, i),
                    e = this.doc.createElement('style');
                return (
                    e.setAttribute('data-no-shim', ''),
                    u.usesCssVars
                        ? i
                            ? ((e['s-sc'] = t = u.scopeId + '-' + this.count),
                              (e.textContent = '/*needs update*/'),
                              this.hostStyleMap.set(n, e),
                              this.hostScopeMap.set(
                                  n,
                                  (function (n, t) {
                                      var r = n.template.map(function (r) {
                                              return 'string' == typeof r ? R(r, n.scopeId, t) : r;
                                          }),
                                          i = n.selectors.map(function (r) {
                                              return Object.assign(Object.assign({}, r), {
                                                  selector: R(r.selector, n.scopeId, t),
                                              });
                                          });
                                      return Object.assign(Object.assign({}, n), {
                                          template: r,
                                          selectors: i,
                                          scopeId: t,
                                      });
                                  })(u, t)
                              ),
                              this.count++)
                            : ((u.styleEl = e),
                              u.usesCssVars || (e.textContent = m(u.template, {})),
                              this.globalScopes.push(u),
                              this.updateGlobal(),
                              this.hostScopeMap.set(n, u))
                        : (e.textContent = r),
                    e
                );
            }),
            (n.prototype.removeHost = function (n) {
                var t = this.hostStyleMap.get(n);
                t && t.remove(), this.hostStyleMap.delete(n), this.hostScopeMap.delete(n);
            }),
            (n.prototype.updateHost = function (n) {
                var t = this.hostScopeMap.get(n);
                if (t && t.usesCssVars && t.isScoped) {
                    var r = this.hostStyleMap.get(n);
                    if (r) {
                        var i = y(
                            (function (n, t, r) {
                                var i = [],
                                    u = (function (n, t) {
                                        for (var r = []; t; ) {
                                            var i = n.get(t);
                                            i && r.push(i), (t = t.parentElement);
                                        }
                                        return r;
                                    })(t, n);
                                return (
                                    r.forEach(function (n) {
                                        return i.push(n);
                                    }),
                                    u.forEach(function (n) {
                                        return i.push(n);
                                    }),
                                    (function (n) {
                                        return (
                                            n.sort(function (n, t) {
                                                return n.specificity === t.specificity
                                                    ? n.nu - t.nu
                                                    : n.specificity - t.specificity;
                                            }),
                                            n
                                        );
                                    })(
                                        E(i).filter(function (t) {
                                            return (function (n, t) {
                                                return ':root' === t || 'html' === t || n.matches(t);
                                            })(n, t.selector);
                                        })
                                    )
                                );
                            })(n, this.hostScopeMap, this.globalScopes)
                        );
                        r.textContent = m(t.template, i);
                    }
                }
            }),
            (n.prototype.updateGlobal = function () {
                O(this.globalScopes);
            }),
            (n.prototype.registerHostTemplate = function (n, t, r) {
                var i = this.scopesMap.get(t);
                return i || (((i = k(n)).scopeId = t), (i.isScoped = r), this.scopesMap.set(t, i)), i;
            }),
            n
        );
    })();
!(function (n) {
    !n ||
        n.__cssshim ||
        (n.CSS && n.CSS.supports && n.CSS.supports('color', 'var(--c)')) ||
        (n.__cssshim = new P(n, n.document));
})('undefined' != typeof window && window);