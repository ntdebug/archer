


#define NUM_COUNTERS_A15 6

static RegisterMap a15_counter_map[NUM_COUNTERS_A15] = {
    {"PMC0", PMC0, PMC, A15_PERFEVTSEL0, A15_PMC0, 0, 0, EVENT_OPTION_NONE_MASK},
    {"PMC1", PMC1, PMC, A15_PERFEVTSEL1, A15_PMC1, 0, 0, EVENT_OPTION_NONE_MASK},
    {"PMC2", PMC2, PMC, A15_PERFEVTSEL2, A15_PMC2, 0, 0, EVENT_OPTION_NONE_MASK},
    {"PMC3", PMC3, PMC, A15_PERFEVTSEL3, A15_PMC3, 0, 0, EVENT_OPTION_NONE_MASK},
    {"PMC4", PMC4, PMC, A15_PERFEVTSEL4, A15_PMC4, 0, 0, EVENT_OPTION_NONE_MASK},
    {"PMC5", PMC5, PMC, A15_PERFEVTSEL5, A15_PMC5, 0, 0, EVENT_OPTION_NONE_MASK},
};

static BoxMap a15_box_map[NUM_UNITS] = {
    [PMC] = {A15_PERF_CONTROL_CTRL, A15_OVERFLOW_STATUS, A15_OVERFLOW_FLAGS, 0, 0, 0, 32},
};

static char* a15_translate_types[NUM_UNITS] = {
    [PMC] = "/sys/bus/event_source/devices/cpu",
};
