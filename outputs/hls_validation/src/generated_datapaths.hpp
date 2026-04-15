#pragma once

#include <cstdint>

#if defined(__INTELFPGA_COMPILER__) || defined(HLS_INTEL)
#include "HLS/hls.h"
#include "HLS/math_dsp_control.h"
#define HLS_COMPONENT component
#else
#define HLS_COMPONENT
#endif
#if defined(__has_cpp_attribute)
#if __has_cpp_attribute(maybe_unused)
#define HLS_MAYBE_UNUSED [[maybe_unused]]
#else
#define HLS_MAYBE_UNUSED
#endif
#else
#define HLS_MAYBE_UNUSED
#endif

using hls_word_t = int32_t;

template <typename F>
static hls_word_t prefer_dsp(F f) {
#if defined(__INTELFPGA_COMPILER__) || defined(HLS_INTEL)
    hls_word_t out = 0;
    ihc::math_dsp_control<ihc::Preference::DSP>([&] { out = f(); });
    return out;
#else
    return f();
#endif
}

template <typename F>
static hls_word_t prefer_softlogic(F f) {
#if defined(__INTELFPGA_COMPILER__) || defined(HLS_INTEL)
    hls_word_t out = 0;
    ihc::math_dsp_control<ihc::Preference::Softlogic>([&] { out = f(); });
    return out;
#else
    return f();
#endif
}

HLS_MAYBE_UNUSED static hls_word_t dsp_add(hls_word_t a, hls_word_t b) { return prefer_dsp([&] { return a + b; }); }
HLS_MAYBE_UNUSED static hls_word_t soft_add(hls_word_t a, hls_word_t b) { return prefer_softlogic([&] { return a + b; }); }
HLS_MAYBE_UNUSED static hls_word_t dsp_sub(hls_word_t a, hls_word_t b) { return prefer_dsp([&] { return a - b; }); }
HLS_MAYBE_UNUSED static hls_word_t soft_sub(hls_word_t a, hls_word_t b) { return prefer_softlogic([&] { return a - b; }); }
HLS_MAYBE_UNUSED static hls_word_t dsp_mul(hls_word_t a, hls_word_t b) { return prefer_dsp([&] { return a * b; }); }
HLS_MAYBE_UNUSED static hls_word_t soft_mul(hls_word_t a, hls_word_t b) { return prefer_softlogic([&] { return a * b; }); }
HLS_MAYBE_UNUSED static hls_word_t dsp_mac(hls_word_t acc, hls_word_t a, hls_word_t b) {
    return prefer_dsp([&] { return acc + a * b; });
}

extern "C" hls_word_t dot16_original(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t dot16_weighted(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t dot16_latency_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t dot16_power_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t dot16_latency_under_dsp(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_blocked_k8_original(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_blocked_k8_weighted(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_blocked_k8_latency_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_blocked_k8_power_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_blocked_k8_latency_under_dsp(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_blocked_k8_latency_under_lut(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t stencil5_original(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t stencil5_weighted(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t stencil5_latency_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t stencil5_power_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t stencil5_latency_under_dsp(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t stencil5_latency_under_lut(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t fir8_original(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t fir8_weighted(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t fir8_latency_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t fir8_power_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t fir8_latency_under_dsp(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t fir8_latency_under_lut(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t conv3x3_original(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t conv3x3_weighted(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t conv3x3_latency_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t conv3x3_power_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t conv3x3_latency_under_dsp(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t conv3x3_latency_under_lut(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_k8_original(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_k8_weighted(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_k8_latency_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_k8_power_unconstrained(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_k8_latency_under_dsp(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
extern "C" hls_word_t gemm_k8_latency_under_lut(hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t, hls_word_t);
