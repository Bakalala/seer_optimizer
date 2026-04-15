#include "generated_datapaths.hpp"

#include <array>
#include <cstdint>
#include <iostream>
#include <random>
#include <string>
#include <vector>

static constexpr int kTestVectors = 1000;
static constexpr int kInputMin = -16;
static constexpr int kInputMax = 16;

int main() {
    std::mt19937 rng(0x5eed1234);
    std::uniform_int_distribution<int> dist(kInputMin, kInputMax);
    int failures = 0;

    std::cout << "Testing conv3x3 (5 optimized variants)..." << std::endl;
    for (int t = 0; t < kTestVectors; ++t) {
        std::array<hls_word_t, 9> inputs{};
        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));
        hls_word_t expected = conv3x3_original(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8]);
        hls_word_t actual_conv3x3_weighted = conv3x3_weighted(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8]);
        if (actual_conv3x3_weighted != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=conv3x3 variant=weighted vector=" << t << " expected=" << expected << " actual=" << actual_conv3x3_weighted << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_conv3x3_latency_unconstrained = conv3x3_latency_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8]);
        if (actual_conv3x3_latency_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=conv3x3 variant=latency_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_conv3x3_latency_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_conv3x3_power_unconstrained = conv3x3_power_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8]);
        if (actual_conv3x3_power_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=conv3x3 variant=power_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_conv3x3_power_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_conv3x3_latency_under_dsp = conv3x3_latency_under_dsp(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8]);
        if (actual_conv3x3_latency_under_dsp != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=conv3x3 variant=latency_under_dsp vector=" << t << " expected=" << expected << " actual=" << actual_conv3x3_latency_under_dsp << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_conv3x3_latency_under_lut = conv3x3_latency_under_lut(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8]);
        if (actual_conv3x3_latency_under_lut != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=conv3x3 variant=latency_under_lut vector=" << t << " expected=" << expected << " actual=" << actual_conv3x3_latency_under_lut << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
    }

    std::cout << "Testing dot16 (4 optimized variants)..." << std::endl;
    for (int t = 0; t < kTestVectors; ++t) {
        std::array<hls_word_t, 32> inputs{};
        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));
        hls_word_t expected = dot16_original(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15], inputs[16], inputs[17], inputs[18], inputs[19], inputs[20], inputs[21], inputs[22], inputs[23], inputs[24], inputs[25], inputs[26], inputs[27], inputs[28], inputs[29], inputs[30], inputs[31]);
        hls_word_t actual_dot16_weighted = dot16_weighted(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15], inputs[16], inputs[17], inputs[18], inputs[19], inputs[20], inputs[21], inputs[22], inputs[23], inputs[24], inputs[25], inputs[26], inputs[27], inputs[28], inputs[29], inputs[30], inputs[31]);
        if (actual_dot16_weighted != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=dot16 variant=weighted vector=" << t << " expected=" << expected << " actual=" << actual_dot16_weighted << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_dot16_latency_unconstrained = dot16_latency_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15], inputs[16], inputs[17], inputs[18], inputs[19], inputs[20], inputs[21], inputs[22], inputs[23], inputs[24], inputs[25], inputs[26], inputs[27], inputs[28], inputs[29], inputs[30], inputs[31]);
        if (actual_dot16_latency_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=dot16 variant=latency_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_dot16_latency_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_dot16_power_unconstrained = dot16_power_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15], inputs[16], inputs[17], inputs[18], inputs[19], inputs[20], inputs[21], inputs[22], inputs[23], inputs[24], inputs[25], inputs[26], inputs[27], inputs[28], inputs[29], inputs[30], inputs[31]);
        if (actual_dot16_power_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=dot16 variant=power_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_dot16_power_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_dot16_latency_under_dsp = dot16_latency_under_dsp(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15], inputs[16], inputs[17], inputs[18], inputs[19], inputs[20], inputs[21], inputs[22], inputs[23], inputs[24], inputs[25], inputs[26], inputs[27], inputs[28], inputs[29], inputs[30], inputs[31]);
        if (actual_dot16_latency_under_dsp != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=dot16 variant=latency_under_dsp vector=" << t << " expected=" << expected << " actual=" << actual_dot16_latency_under_dsp << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
    }

    std::cout << "Testing fir8 (5 optimized variants)..." << std::endl;
    for (int t = 0; t < kTestVectors; ++t) {
        std::array<hls_word_t, 8> inputs{};
        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));
        hls_word_t expected = fir8_original(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
        hls_word_t actual_fir8_weighted = fir8_weighted(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
        if (actual_fir8_weighted != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=fir8 variant=weighted vector=" << t << " expected=" << expected << " actual=" << actual_fir8_weighted << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_fir8_latency_unconstrained = fir8_latency_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
        if (actual_fir8_latency_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=fir8 variant=latency_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_fir8_latency_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_fir8_power_unconstrained = fir8_power_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
        if (actual_fir8_power_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=fir8 variant=power_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_fir8_power_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_fir8_latency_under_dsp = fir8_latency_under_dsp(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
        if (actual_fir8_latency_under_dsp != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=fir8 variant=latency_under_dsp vector=" << t << " expected=" << expected << " actual=" << actual_fir8_latency_under_dsp << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_fir8_latency_under_lut = fir8_latency_under_lut(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7]);
        if (actual_fir8_latency_under_lut != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=fir8 variant=latency_under_lut vector=" << t << " expected=" << expected << " actual=" << actual_fir8_latency_under_lut << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
    }

    std::cout << "Testing gemm_blocked_k8 (5 optimized variants)..." << std::endl;
    for (int t = 0; t < kTestVectors; ++t) {
        std::array<hls_word_t, 16> inputs{};
        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));
        hls_word_t expected = gemm_blocked_k8_original(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        hls_word_t actual_gemm_blocked_k8_weighted = gemm_blocked_k8_weighted(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_blocked_k8_weighted != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_blocked_k8 variant=weighted vector=" << t << " expected=" << expected << " actual=" << actual_gemm_blocked_k8_weighted << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_blocked_k8_latency_unconstrained = gemm_blocked_k8_latency_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_blocked_k8_latency_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_blocked_k8 variant=latency_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_gemm_blocked_k8_latency_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_blocked_k8_power_unconstrained = gemm_blocked_k8_power_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_blocked_k8_power_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_blocked_k8 variant=power_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_gemm_blocked_k8_power_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_blocked_k8_latency_under_dsp = gemm_blocked_k8_latency_under_dsp(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_blocked_k8_latency_under_dsp != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_blocked_k8 variant=latency_under_dsp vector=" << t << " expected=" << expected << " actual=" << actual_gemm_blocked_k8_latency_under_dsp << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_blocked_k8_latency_under_lut = gemm_blocked_k8_latency_under_lut(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_blocked_k8_latency_under_lut != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_blocked_k8 variant=latency_under_lut vector=" << t << " expected=" << expected << " actual=" << actual_gemm_blocked_k8_latency_under_lut << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
    }

    std::cout << "Testing gemm_k8 (5 optimized variants)..." << std::endl;
    for (int t = 0; t < kTestVectors; ++t) {
        std::array<hls_word_t, 16> inputs{};
        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));
        hls_word_t expected = gemm_k8_original(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        hls_word_t actual_gemm_k8_weighted = gemm_k8_weighted(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_k8_weighted != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_k8 variant=weighted vector=" << t << " expected=" << expected << " actual=" << actual_gemm_k8_weighted << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_k8_latency_unconstrained = gemm_k8_latency_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_k8_latency_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_k8 variant=latency_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_gemm_k8_latency_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_k8_power_unconstrained = gemm_k8_power_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_k8_power_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_k8 variant=power_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_gemm_k8_power_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_k8_latency_under_dsp = gemm_k8_latency_under_dsp(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_k8_latency_under_dsp != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_k8 variant=latency_under_dsp vector=" << t << " expected=" << expected << " actual=" << actual_gemm_k8_latency_under_dsp << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_gemm_k8_latency_under_lut = gemm_k8_latency_under_lut(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4], inputs[5], inputs[6], inputs[7], inputs[8], inputs[9], inputs[10], inputs[11], inputs[12], inputs[13], inputs[14], inputs[15]);
        if (actual_gemm_k8_latency_under_lut != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=gemm_k8 variant=latency_under_lut vector=" << t << " expected=" << expected << " actual=" << actual_gemm_k8_latency_under_lut << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
    }

    std::cout << "Testing stencil5 (5 optimized variants)..." << std::endl;
    for (int t = 0; t < kTestVectors; ++t) {
        std::array<hls_word_t, 5> inputs{};
        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));
        hls_word_t expected = stencil5_original(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]);
        hls_word_t actual_stencil5_weighted = stencil5_weighted(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]);
        if (actual_stencil5_weighted != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=stencil5 variant=weighted vector=" << t << " expected=" << expected << " actual=" << actual_stencil5_weighted << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_stencil5_latency_unconstrained = stencil5_latency_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]);
        if (actual_stencil5_latency_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=stencil5 variant=latency_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_stencil5_latency_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_stencil5_power_unconstrained = stencil5_power_unconstrained(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]);
        if (actual_stencil5_power_unconstrained != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=stencil5 variant=power_unconstrained vector=" << t << " expected=" << expected << " actual=" << actual_stencil5_power_unconstrained << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_stencil5_latency_under_dsp = stencil5_latency_under_dsp(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]);
        if (actual_stencil5_latency_under_dsp != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=stencil5 variant=latency_under_dsp vector=" << t << " expected=" << expected << " actual=" << actual_stencil5_latency_under_dsp << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
        hls_word_t actual_stencil5_latency_under_lut = stencil5_latency_under_lut(inputs[0], inputs[1], inputs[2], inputs[3], inputs[4]);
        if (actual_stencil5_latency_under_lut != expected) {
            ++failures;
            std::cerr << "Mismatch benchmark=stencil5 variant=latency_under_lut vector=" << t << " expected=" << expected << " actual=" << actual_stencil5_latency_under_lut << std::endl;
            std::cerr << "inputs:";
            for (const auto value : inputs) std::cerr << ' ' << value;
            std::cerr << std::endl;
            return 1;
        }
    }

    if (failures == 0) {
        std::cout << "All generated datapath tests passed." << std::endl;
    }
    return failures == 0 ? 0 : 1;
}
