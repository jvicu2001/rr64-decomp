SECTIONS
{
    __romPos = 0;
    header_ROM_START = __romPos;
    header_VRAM = ADDR(.header);
    .header : AT(header_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        header_DATA_START = .;
        build/asm/header.s.o(.data);
        header_DATA_END = .;
        header_DATA_SIZE = ABSOLUTE(header_DATA_END - header_DATA_START);
    }
    __romPos += SIZEOF(.header);
    header_ROM_END = __romPos;
    header_VRAM_END = .;

    boot_ROM_START = __romPos;
    boot_VRAM = ADDR(.boot);
    .boot : AT(boot_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        boot_DATA_START = .;
        build/assets/boot.bin.o(.data);
        boot_DATA_END = .;
        boot_DATA_SIZE = ABSOLUTE(boot_DATA_END - boot_DATA_START);
    }
    __romPos += SIZEOF(.boot);
    boot_ROM_END = __romPos;
    boot_VRAM_END = .;

    entry_ROM_START = __romPos;
    entry_VRAM = ADDR(.entry);
    .entry 0x80000450 : AT(entry_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        entry_TEXT_START = .;
        build/asm/1000.s.o(.text);
        . = ALIGN(., 16);
        entry_TEXT_END = .;
        entry_TEXT_SIZE = ABSOLUTE(entry_TEXT_END - entry_TEXT_START);
        entry_DATA_START = .;
        build/asm/1000.s.o(.data);
        . = ALIGN(., 16);
        entry_DATA_END = .;
        entry_DATA_SIZE = ABSOLUTE(entry_DATA_END - entry_DATA_START);
        entry_RODATA_START = .;
        build/asm/1000.s.o(.rodata);
        . = ALIGN(., 16);
        entry_RODATA_END = .;
        entry_RODATA_SIZE = ABSOLUTE(entry_RODATA_END - entry_RODATA_START);
    }
    entry_bss_VRAM = ADDR(.entry_bss);
    .entry_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        entry_BSS_START = .;
        build/asm/1000.s.o(.bss);
        . = ALIGN(., 16);
        entry_BSS_END = .;
        entry_BSS_SIZE = ABSOLUTE(entry_BSS_END - entry_BSS_START);
    }
    __romPos += SIZEOF(.entry);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    entry_ROM_END = __romPos;
    entry_VRAM_END = .;

    main_ROM_START = __romPos;
    main_VRAM = ADDR(.main);
    .main 0x800004A0 : AT(main_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        main_TEXT_START = .;
        build/asm/1050.s.o(.text);
        build/asm/10F30.s.o(.text);
        . = ALIGN(., 16);
        main_TEXT_END = .;
        main_TEXT_SIZE = ABSOLUTE(main_TEXT_END - main_TEXT_START);
        main_DATA_START = .;
        build/asm/1050.s.o(.data);
        build/asm/10F30.s.o(.data);
        build/asm/data/1ED00.data.s.o(.data);
        . = ALIGN(., 16);
        main_DATA_END = .;
        main_DATA_SIZE = ABSOLUTE(main_DATA_END - main_DATA_START);
        main_RODATA_START = .;
        build/asm/1050.s.o(.rodata);
        build/asm/10F30.s.o(.rodata);
        . = ALIGN(., 16);
        main_RODATA_END = .;
        main_RODATA_SIZE = ABSOLUTE(main_RODATA_END - main_RODATA_START);
    }
    main_bss_VRAM = ADDR(.main_bss);
    .main_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        main_BSS_START = .;
        build/asm/1050.s.o(.bss);
        build/asm/10F30.s.o(.bss);
        . = ALIGN(., 16);
        main_BSS_END = .;
        main_BSS_SIZE = ABSOLUTE(main_BSS_END - main_BSS_START);
    }
    __romPos += SIZEOF(.main);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    main_ROM_END = __romPos;
    main_VRAM_END = .;

    gamecode_ROM_START = __romPos;
    gamecode_VRAM = ADDR(.gamecode);
    .gamecode 0x800C3A00 : AT(gamecode_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        gamecode_TEXT_START = .;
        build/asm/data/gamecode_header.rodata.s.o(.rodata);
        build/asm/35660.s.o(.text);
        . = ALIGN(., 16);
        gamecode_TEXT_END = .;
        gamecode_TEXT_SIZE = ABSOLUTE(gamecode_TEXT_END - gamecode_TEXT_START);
        gamecode_DATA_START = .;
        build/asm/35660.s.o(.data);
        build/asm/data/80260.data.s.o(.data);
        . = ALIGN(., 16);
        gamecode_DATA_END = .;
        gamecode_DATA_SIZE = ABSOLUTE(gamecode_DATA_END - gamecode_DATA_START);
        gamecode_RODATA_START = .;
        build/asm/35660.s.o(.rodata);
        . = ALIGN(., 16);
        gamecode_RODATA_END = .;
        gamecode_RODATA_SIZE = ABSOLUTE(gamecode_RODATA_END - gamecode_RODATA_START);
    }
    gamecode_bss_VRAM = ADDR(.gamecode_bss);
    .gamecode_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        gamecode_BSS_START = .;
        build/asm/35660.s.o(.bss);
        . = ALIGN(., 16);
        gamecode_BSS_END = .;
        gamecode_BSS_SIZE = ABSOLUTE(gamecode_BSS_END - gamecode_BSS_START);
    }
    __romPos += SIZEOF(.gamecode);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    gamecode_ROM_END = __romPos;
    gamecode_VRAM_END = .;

    cardata_ROM_START = __romPos;
    cardata_VRAM = ADDR(.cardata);
    .cardata 0x800C3A00 : AT(cardata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        cardata_DATA_START = .;
        build/assets/cardata.bin.o(.data);
        cardata_DATA_END = .;
        cardata_DATA_SIZE = ABSOLUTE(cardata_DATA_END - cardata_DATA_START);
    }
    __romPos += SIZEOF(.cardata);
    cardata_ROM_END = __romPos;
    cardata_VRAM_END = .;

    galaga_ROM_START = __romPos;
    galaga_VRAM = ADDR(.galaga);
    .galaga 0x800C3A00 : AT(galaga_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        galaga_TEXT_START = .;
        build/asm/data/galaga_header.rodata.s.o(.rodata);
        build/asm/218090.s.o(.text);
        . = ALIGN(., 16);
        galaga_TEXT_END = .;
        galaga_TEXT_SIZE = ABSOLUTE(galaga_TEXT_END - galaga_TEXT_START);
        galaga_DATA_START = .;
        build/asm/218090.s.o(.data);
        build/asm/data/21B870.data.s.o(.data);
        . = ALIGN(., 16);
        galaga_DATA_END = .;
        galaga_DATA_SIZE = ABSOLUTE(galaga_DATA_END - galaga_DATA_START);
        galaga_RODATA_START = .;
        build/asm/218090.s.o(.rodata);
        . = ALIGN(., 16);
        galaga_RODATA_END = .;
        galaga_RODATA_SIZE = ABSOLUTE(galaga_RODATA_END - galaga_RODATA_START);
    }
    galaga_bss_VRAM = ADDR(.galaga_bss);
    .galaga_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        galaga_BSS_START = .;
        build/asm/218090.s.o(.bss);
        . = ALIGN(., 16);
        galaga_BSS_END = .;
        galaga_BSS_SIZE = ABSOLUTE(galaga_BSS_END - galaga_BSS_START);
    }
    __romPos += SIZEOF(.galaga);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    galaga_ROM_END = __romPos;
    galaga_VRAM_END = .;

    legalscreen_ROM_START = __romPos;
    legalscreen_VRAM = ADDR(.legalscreen);
    .legalscreen 0x800C3A00 : AT(legalscreen_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        legalscreen_TEXT_START = .;
        build/asm/data/legalscreen_header.rodata.s.o(.rodata);
        build/asm/225D00.s.o(.text);
        . = ALIGN(., 16);
        legalscreen_TEXT_END = .;
        legalscreen_TEXT_SIZE = ABSOLUTE(legalscreen_TEXT_END - legalscreen_TEXT_START);
        legalscreen_DATA_START = .;
        build/asm/225D00.s.o(.data);
        build/asm/data/228A60.data.s.o(.data);
        . = ALIGN(., 16);
        legalscreen_DATA_END = .;
        legalscreen_DATA_SIZE = ABSOLUTE(legalscreen_DATA_END - legalscreen_DATA_START);
        legalscreen_RODATA_START = .;
        build/asm/225D00.s.o(.rodata);
        . = ALIGN(., 16);
        legalscreen_RODATA_END = .;
        legalscreen_RODATA_SIZE = ABSOLUTE(legalscreen_RODATA_END - legalscreen_RODATA_START);
    }
    legalscreen_bss_VRAM = ADDR(.legalscreen_bss);
    .legalscreen_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        legalscreen_BSS_START = .;
        build/asm/225D00.s.o(.bss);
        . = ALIGN(., 16);
        legalscreen_BSS_END = .;
        legalscreen_BSS_SIZE = ABSOLUTE(legalscreen_BSS_END - legalscreen_BSS_START);
    }
    __romPos += SIZEOF(.legalscreen);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    legalscreen_ROM_END = __romPos;
    legalscreen_VRAM_END = .;

    nstlogo_ROM_START = __romPos;
    nstlogo_VRAM = ADDR(.nstlogo);
    .nstlogo 0x800C3A00 : AT(nstlogo_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        nstlogo_TEXT_START = .;
        build/asm/data/nstlogo_header.rodata.s.o(.rodata);
        build/asm/2A2720.s.o(.text);
        . = ALIGN(., 16);
        nstlogo_TEXT_END = .;
        nstlogo_TEXT_SIZE = ABSOLUTE(nstlogo_TEXT_END - nstlogo_TEXT_START);
        nstlogo_DATA_START = .;
        build/asm/2A2720.s.o(.data);
        build/asm/data/2A4950.data.s.o(.data);
        . = ALIGN(., 16);
        nstlogo_DATA_END = .;
        nstlogo_DATA_SIZE = ABSOLUTE(nstlogo_DATA_END - nstlogo_DATA_START);
        nstlogo_RODATA_START = .;
        build/asm/2A2720.s.o(.rodata);
        . = ALIGN(., 16);
        nstlogo_RODATA_END = .;
        nstlogo_RODATA_SIZE = ABSOLUTE(nstlogo_RODATA_END - nstlogo_RODATA_START);
    }
    nstlogo_bss_VRAM = ADDR(.nstlogo_bss);
    .nstlogo_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        nstlogo_BSS_START = .;
        build/asm/2A2720.s.o(.bss);
        . = ALIGN(., 16);
        nstlogo_BSS_END = .;
        nstlogo_BSS_SIZE = ABSOLUTE(nstlogo_BSS_END - nstlogo_BSS_START);
    }
    __romPos += SIZEOF(.nstlogo);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    nstlogo_ROM_END = __romPos;
    nstlogo_VRAM_END = .;

    menu_ROM_START = __romPos;
    menu_VRAM = ADDR(.menu);
    .menu 0x800C3A00 : AT(menu_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        menu_TEXT_START = .;
        build/asm/data/menu_header.rodata.s.o(.rodata);
        build/asm/2B3700.s.o(.text);
        . = ALIGN(., 16);
        menu_TEXT_END = .;
        menu_TEXT_SIZE = ABSOLUTE(menu_TEXT_END - menu_TEXT_START);
        menu_DATA_START = .;
        build/asm/2B3700.s.o(.data);
        build/asm/data/2EC830.data.s.o(.data);
        . = ALIGN(., 16);
        menu_DATA_END = .;
        menu_DATA_SIZE = ABSOLUTE(menu_DATA_END - menu_DATA_START);
        menu_RODATA_START = .;
        build/asm/2B3700.s.o(.rodata);
        . = ALIGN(., 16);
        menu_RODATA_END = .;
        menu_RODATA_SIZE = ABSOLUTE(menu_RODATA_END - menu_RODATA_START);
    }
    menu_bss_VRAM = ADDR(.menu_bss);
    .menu_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        menu_BSS_START = .;
        build/asm/2B3700.s.o(.bss);
        . = ALIGN(., 16);
        menu_BSS_END = .;
        menu_BSS_SIZE = ABSOLUTE(menu_BSS_END - menu_BSS_START);
    }
    __romPos += SIZEOF(.menu);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    menu_ROM_END = __romPos;
    menu_VRAM_END = .;

    paneledit_ROM_START = __romPos;
    paneledit_VRAM = ADDR(.paneledit);
    .paneledit 0x80126EB0 : AT(paneledit_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        paneledit_TEXT_START = .;
        build/asm/data/paneledit_header.rodata.s.o(.rodata);
        build/asm/32BAD0.s.o(.text);
        . = ALIGN(., 16);
        paneledit_TEXT_END = .;
        paneledit_TEXT_SIZE = ABSOLUTE(paneledit_TEXT_END - paneledit_TEXT_START);
        paneledit_DATA_START = .;
        build/asm/32BAD0.s.o(.data);
        build/asm/data/32D350.data.s.o(.data);
        . = ALIGN(., 16);
        paneledit_DATA_END = .;
        paneledit_DATA_SIZE = ABSOLUTE(paneledit_DATA_END - paneledit_DATA_START);
        paneledit_RODATA_START = .;
        build/asm/32BAD0.s.o(.rodata);
        . = ALIGN(., 16);
        paneledit_RODATA_END = .;
        paneledit_RODATA_SIZE = ABSOLUTE(paneledit_RODATA_END - paneledit_RODATA_START);
    }
    paneledit_bss_VRAM = ADDR(.paneledit_bss);
    .paneledit_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        paneledit_BSS_START = .;
        build/asm/32BAD0.s.o(.bss);
        . = ALIGN(., 16);
        paneledit_BSS_END = .;
        paneledit_BSS_SIZE = ABSOLUTE(paneledit_BSS_END - paneledit_BSS_START);
    }
    __romPos += SIZEOF(.paneledit);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    paneledit_ROM_END = __romPos;
    paneledit_VRAM_END = .;

    novice_ROM_START = __romPos;
    novice_VRAM = ADDR(.novice);
    .novice 0x80126EB0 : AT(novice_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        novice_TEXT_START = .;
        build/asm/data/novice_header.rodata.s.o(.rodata);
        build/asm/357180.s.o(.text);
        . = ALIGN(., 16);
        novice_TEXT_END = .;
        novice_TEXT_SIZE = ABSOLUTE(novice_TEXT_END - novice_TEXT_START);
        novice_DATA_START = .;
        build/asm/357180.s.o(.data);
        build/asm/data/357240.data.s.o(.data);
        . = ALIGN(., 16);
        novice_DATA_END = .;
        novice_DATA_SIZE = ABSOLUTE(novice_DATA_END - novice_DATA_START);
        novice_RODATA_START = .;
        build/asm/357180.s.o(.rodata);
        . = ALIGN(., 16);
        novice_RODATA_END = .;
        novice_RODATA_SIZE = ABSOLUTE(novice_RODATA_END - novice_RODATA_START);
    }
    novice_bss_VRAM = ADDR(.novice_bss);
    .novice_bss (NOLOAD) : SUBALIGN(16)
    {
        FILL(0x00000000);
        novice_BSS_START = .;
        build/asm/357180.s.o(.bss);
        . = ALIGN(., 16);
        novice_BSS_END = .;
        novice_BSS_SIZE = ABSOLUTE(novice_BSS_END - novice_BSS_START);
    }
    __romPos += SIZEOF(.novice);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    novice_ROM_END = __romPos;
    novice_VRAM_END = .;

    inter_ROM_START = __romPos;
    inter_VRAM = ADDR(.inter);
    .inter 0x80126EB0 : AT(inter_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        inter_DATA_START = .;
        build/assets/3BA6C0.bin.o(.data);
        . = ALIGN(., 16);
        inter_DATA_END = .;
        inter_DATA_SIZE = ABSOLUTE(inter_DATA_END - inter_DATA_START);
    }
    __romPos += SIZEOF(.inter);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    inter_ROM_END = __romPos;
    inter_VRAM_END = .;

    expert_ROM_START = __romPos;
    expert_VRAM = ADDR(.expert);
    .expert 0x80126EB0 : AT(expert_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        expert_DATA_START = .;
        build/assets/440340.bin.o(.data);
        . = ALIGN(., 16);
        expert_DATA_END = .;
        expert_DATA_SIZE = ABSOLUTE(expert_DATA_END - expert_DATA_START);
    }
    __romPos += SIZEOF(.expert);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    expert_ROM_END = __romPos;
    expert_VRAM_END = .;

    r2speed_ROM_START = __romPos;
    r2speed_VRAM = ADDR(.r2speed);
    .r2speed 0x80126EB0 : AT(r2speed_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        r2speed_DATA_START = .;
        build/assets/4D1E10.bin.o(.data);
        . = ALIGN(., 16);
        r2speed_DATA_END = .;
        r2speed_DATA_SIZE = ABSOLUTE(r2speed_DATA_END - r2speed_DATA_START);
    }
    __romPos += SIZEOF(.r2speed);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    r2speed_ROM_END = __romPos;
    r2speed_VRAM_END = .;

    oldnovice_ROM_START = __romPos;
    oldnovice_VRAM = ADDR(.oldnovice);
    .oldnovice 0x80126EB0 : AT(oldnovice_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        oldnovice_DATA_START = .;
        build/assets/533040.bin.o(.data);
        . = ALIGN(., 16);
        oldnovice_DATA_END = .;
        oldnovice_DATA_SIZE = ABSOLUTE(oldnovice_DATA_END - oldnovice_DATA_START);
    }
    __romPos += SIZEOF(.oldnovice);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    oldnovice_ROM_END = __romPos;
    oldnovice_VRAM_END = .;

    oldexpert_ROM_START = __romPos;
    oldexpert_VRAM = ADDR(.oldexpert);
    .oldexpert 0x80126EB0 : AT(oldexpert_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        oldexpert_DATA_START = .;
        build/assets/5B62C0.bin.o(.data);
        . = ALIGN(., 16);
        oldexpert_DATA_END = .;
        oldexpert_DATA_SIZE = ABSOLUTE(oldexpert_DATA_END - oldexpert_DATA_START);
    }
    __romPos += SIZEOF(.oldexpert);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    oldexpert_ROM_END = __romPos;
    oldexpert_VRAM_END = .;

    r4expert_ROM_START = __romPos;
    r4expert_VRAM = ADDR(.r4expert);
    .r4expert 0x80126EB0 : AT(r4expert_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        r4expert_DATA_START = .;
        build/assets/643680.bin.o(.data);
        . = ALIGN(., 16);
        r4expert_DATA_END = .;
        r4expert_DATA_SIZE = ABSOLUTE(r4expert_DATA_END - r4expert_DATA_START);
    }
    __romPos += SIZEOF(.r4expert);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    r4expert_ROM_END = __romPos;
    r4expert_VRAM_END = .;

    r4inter_ROM_START = __romPos;
    r4inter_VRAM = ADDR(.r4inter);
    .r4inter 0x80126EB0 : AT(r4inter_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        r4inter_DATA_START = .;
        build/assets/6C6A40.bin.o(.data);
        . = ALIGN(., 16);
        r4inter_DATA_END = .;
        r4inter_DATA_SIZE = ABSOLUTE(r4inter_DATA_END - r4inter_DATA_START);
    }
    __romPos += SIZEOF(.r4inter);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    r4inter_ROM_END = __romPos;
    r4inter_VRAM_END = .;

    r4novice_ROM_START = __romPos;
    r4novice_VRAM = ADDR(.r4novice);
    .r4novice 0x80126EB0 : AT(r4novice_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        r4novice_DATA_START = .;
        build/assets/72FA40.bin.o(.data);
        . = ALIGN(., 16);
        r4novice_DATA_END = .;
        r4novice_DATA_SIZE = ABSOLUTE(r4novice_DATA_END - r4novice_DATA_START);
    }
    __romPos += SIZEOF(.r4novice);
    __romPos = ALIGN(__romPos, 16);
    . = ALIGN(., 16);
    r4novice_ROM_END = __romPos;
    r4novice_VRAM_END = .;

    globaluidata_ROM_START = __romPos;
    globaluidata_VRAM = ADDR(.globaluidata);
    .globaluidata 0x8026C910 : AT(globaluidata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        globaluidata_DATA_START = .;
        build/assets/globaluidata.bin.o(.data);
        globaluidata_DATA_END = .;
        globaluidata_DATA_SIZE = ABSOLUTE(globaluidata_DATA_END - globaluidata_DATA_START);
    }
    __romPos += SIZEOF(.globaluidata);
    globaluidata_ROM_END = __romPos;
    globaluidata_VRAM_END = .;

    intro_ROM_START = __romPos;
    intro_VRAM = ADDR(.intro);
    .intro 0x80227190 : AT(intro_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        intro_DATA_START = .;
        build/assets/intro.bin.o(.data);
        intro_DATA_END = .;
        intro_DATA_SIZE = ABSOLUTE(intro_DATA_END - intro_DATA_START);
    }
    __romPos += SIZEOF(.intro);
    intro_ROM_END = __romPos;
    intro_VRAM_END = .;

    gameuidata_ROM_START = __romPos;
    gameuidata_VRAM = ADDR(.gameuidata);
    .gameuidata 0x8026F730 : AT(gameuidata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        gameuidata_DATA_START = .;
        build/assets/gameuidata.bin.o(.data);
        gameuidata_DATA_END = .;
        gameuidata_DATA_SIZE = ABSOLUTE(gameuidata_DATA_END - gameuidata_DATA_START);
    }
    __romPos += SIZEOF(.gameuidata);
    gameuidata_ROM_END = __romPos;
    gameuidata_VRAM_END = .;

    replayuidata_ROM_START = __romPos;
    replayuidata_VRAM = ADDR(.replayuidata);
    .replayuidata 0x8026F730 : AT(replayuidata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        replayuidata_DATA_START = .;
        build/assets/replayuidata.bin.o(.data);
        replayuidata_DATA_END = .;
        replayuidata_DATA_SIZE = ABSOLUTE(replayuidata_DATA_END - replayuidata_DATA_START);
    }
    __romPos += SIZEOF(.replayuidata);
    replayuidata_ROM_END = __romPos;
    replayuidata_VRAM_END = .;

    cdplaydata_ROM_START = __romPos;
    cdplaydata_VRAM = ADDR(.cdplaydata);
    .cdplaydata 0x8026F730 : AT(cdplaydata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        cdplaydata_DATA_START = .;
        build/assets/cdplaydata.bin.o(.data);
        cdplaydata_DATA_END = .;
        cdplaydata_DATA_SIZE = ABSOLUTE(cdplaydata_DATA_END - cdplaydata_DATA_START);
    }
    __romPos += SIZEOF(.cdplaydata);
    cdplaydata_ROM_END = __romPos;
    cdplaydata_VRAM_END = .;

    battleuidata_ROM_START = __romPos;
    battleuidata_VRAM = ADDR(.battleuidata);
    .battleuidata 0x8027E8A0 : AT(battleuidata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        battleuidata_DATA_START = .;
        build/assets/battleuidata.bin.o(.data);
        battleuidata_DATA_END = .;
        battleuidata_DATA_SIZE = ABSOLUTE(battleuidata_DATA_END - battleuidata_DATA_START);
    }
    __romPos += SIZEOF(.battleuidata);
    battleuidata_ROM_END = __romPos;
    battleuidata_VRAM_END = .;

    raceuidata_ROM_START = __romPos;
    raceuidata_VRAM = ADDR(.raceuidata);
    .raceuidata 0x8027E8A0 : AT(raceuidata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        raceuidata_DATA_START = .;
        build/assets/raceuidata.bin.o(.data);
        raceuidata_DATA_END = .;
        raceuidata_DATA_SIZE = ABSOLUTE(raceuidata_DATA_END - raceuidata_DATA_START);
    }
    __romPos += SIZEOF(.raceuidata);
    raceuidata_ROM_END = __romPos;
    raceuidata_VRAM_END = .;

    clouds1_ROM_START = __romPos;
    clouds1_VRAM = ADDR(.clouds1);
    .clouds1 0x80288640 : AT(clouds1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds1_DATA_START = .;
        build/assets/clouds1.bin.o(.data);
        clouds1_DATA_END = .;
        clouds1_DATA_SIZE = ABSOLUTE(clouds1_DATA_END - clouds1_DATA_START);
    }
    __romPos += SIZEOF(.clouds1);
    clouds1_ROM_END = __romPos;
    clouds1_VRAM_END = .;

    clouds2_ROM_START = __romPos;
    clouds2_VRAM = ADDR(.clouds2);
    .clouds2 0x80288640 : AT(clouds2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds2_DATA_START = .;
        build/assets/clouds2.bin.o(.data);
        clouds2_DATA_END = .;
        clouds2_DATA_SIZE = ABSOLUTE(clouds2_DATA_END - clouds2_DATA_START);
    }
    __romPos += SIZEOF(.clouds2);
    clouds2_ROM_END = __romPos;
    clouds2_VRAM_END = .;

    clouds3_ROM_START = __romPos;
    clouds3_VRAM = ADDR(.clouds3);
    .clouds3 0x80288640 : AT(clouds3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds3_DATA_START = .;
        build/assets/clouds3.bin.o(.data);
        clouds3_DATA_END = .;
        clouds3_DATA_SIZE = ABSOLUTE(clouds3_DATA_END - clouds3_DATA_START);
    }
    __romPos += SIZEOF(.clouds3);
    clouds3_ROM_END = __romPos;
    clouds3_VRAM_END = .;

    clouds4_ROM_START = __romPos;
    clouds4_VRAM = ADDR(.clouds4);
    .clouds4 0x80288640 : AT(clouds4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds4_DATA_START = .;
        build/assets/clouds4.bin.o(.data);
        clouds4_DATA_END = .;
        clouds4_DATA_SIZE = ABSOLUTE(clouds4_DATA_END - clouds4_DATA_START);
    }
    __romPos += SIZEOF(.clouds4);
    clouds4_ROM_END = __romPos;
    clouds4_VRAM_END = .;

    clouds5_ROM_START = __romPos;
    clouds5_VRAM = ADDR(.clouds5);
    .clouds5 0x80288640 : AT(clouds5_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds5_DATA_START = .;
        build/assets/clouds5.bin.o(.data);
        clouds5_DATA_END = .;
        clouds5_DATA_SIZE = ABSOLUTE(clouds5_DATA_END - clouds5_DATA_START);
    }
    __romPos += SIZEOF(.clouds5);
    clouds5_ROM_END = __romPos;
    clouds5_VRAM_END = .;

    clouds6_ROM_START = __romPos;
    clouds6_VRAM = ADDR(.clouds6);
    .clouds6 0x80288640 : AT(clouds6_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds6_DATA_START = .;
        build/assets/clouds6.bin.o(.data);
        clouds6_DATA_END = .;
        clouds6_DATA_SIZE = ABSOLUTE(clouds6_DATA_END - clouds6_DATA_START);
    }
    __romPos += SIZEOF(.clouds6);
    clouds6_ROM_END = __romPos;
    clouds6_VRAM_END = .;

    clouds7_ROM_START = __romPos;
    clouds7_VRAM = ADDR(.clouds7);
    .clouds7 0x80288640 : AT(clouds7_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds7_DATA_START = .;
        build/assets/clouds7.bin.o(.data);
        clouds7_DATA_END = .;
        clouds7_DATA_SIZE = ABSOLUTE(clouds7_DATA_END - clouds7_DATA_START);
    }
    __romPos += SIZEOF(.clouds7);
    clouds7_ROM_END = __romPos;
    clouds7_VRAM_END = .;

    clouds8_ROM_START = __romPos;
    clouds8_VRAM = ADDR(.clouds8);
    .clouds8 0x80288640 : AT(clouds8_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds8_DATA_START = .;
        build/assets/clouds8.bin.o(.data);
        clouds8_DATA_END = .;
        clouds8_DATA_SIZE = ABSOLUTE(clouds8_DATA_END - clouds8_DATA_START);
    }
    __romPos += SIZEOF(.clouds8);
    clouds8_ROM_END = __romPos;
    clouds8_VRAM_END = .;

    clouds9_ROM_START = __romPos;
    clouds9_VRAM = ADDR(.clouds9);
    .clouds9 0x80288640 : AT(clouds9_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds9_DATA_START = .;
        build/assets/clouds9.bin.o(.data);
        clouds9_DATA_END = .;
        clouds9_DATA_SIZE = ABSOLUTE(clouds9_DATA_END - clouds9_DATA_START);
    }
    __romPos += SIZEOF(.clouds9);
    clouds9_ROM_END = __romPos;
    clouds9_VRAM_END = .;

    clouds10_ROM_START = __romPos;
    clouds10_VRAM = ADDR(.clouds10);
    .clouds10 0x80288640 : AT(clouds10_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        clouds10_DATA_START = .;
        build/assets/clouds10.bin.o(.data);
        clouds10_DATA_END = .;
        clouds10_DATA_SIZE = ABSOLUTE(clouds10_DATA_END - clouds10_DATA_START);
    }
    __romPos += SIZEOF(.clouds10);
    clouds10_ROM_END = __romPos;
    clouds10_VRAM_END = .;

    pictData0_ROM_START = __romPos;
    pictData0_VRAM = ADDR(.pictData0);
    .pictData0 0x80239260 : AT(pictData0_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData0_DATA_START = .;
        build/assets/pictData0.bin.o(.data);
        pictData0_DATA_END = .;
        pictData0_DATA_SIZE = ABSOLUTE(pictData0_DATA_END - pictData0_DATA_START);
    }
    __romPos += SIZEOF(.pictData0);
    pictData0_ROM_END = __romPos;
    pictData0_VRAM_END = .;

    pictData1_ROM_START = __romPos;
    pictData1_VRAM = ADDR(.pictData1);
    .pictData1 0x80239260 : AT(pictData1_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData1_DATA_START = .;
        build/assets/pictData1.bin.o(.data);
        pictData1_DATA_END = .;
        pictData1_DATA_SIZE = ABSOLUTE(pictData1_DATA_END - pictData1_DATA_START);
    }
    __romPos += SIZEOF(.pictData1);
    pictData1_ROM_END = __romPos;
    pictData1_VRAM_END = .;

    pictData2_ROM_START = __romPos;
    pictData2_VRAM = ADDR(.pictData2);
    .pictData2 0x80239260 : AT(pictData2_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData2_DATA_START = .;
        build/assets/pictData2.bin.o(.data);
        pictData2_DATA_END = .;
        pictData2_DATA_SIZE = ABSOLUTE(pictData2_DATA_END - pictData2_DATA_START);
    }
    __romPos += SIZEOF(.pictData2);
    pictData2_ROM_END = __romPos;
    pictData2_VRAM_END = .;

    pictData3_ROM_START = __romPos;
    pictData3_VRAM = ADDR(.pictData3);
    .pictData3 0x80239260 : AT(pictData3_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData3_DATA_START = .;
        build/assets/pictData3.bin.o(.data);
        pictData3_DATA_END = .;
        pictData3_DATA_SIZE = ABSOLUTE(pictData3_DATA_END - pictData3_DATA_START);
    }
    __romPos += SIZEOF(.pictData3);
    pictData3_ROM_END = __romPos;
    pictData3_VRAM_END = .;

    pictData4_ROM_START = __romPos;
    pictData4_VRAM = ADDR(.pictData4);
    .pictData4 0x80239260 : AT(pictData4_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData4_DATA_START = .;
        build/assets/pictData4.bin.o(.data);
        pictData4_DATA_END = .;
        pictData4_DATA_SIZE = ABSOLUTE(pictData4_DATA_END - pictData4_DATA_START);
    }
    __romPos += SIZEOF(.pictData4);
    pictData4_ROM_END = __romPos;
    pictData4_VRAM_END = .;

    pictData5_ROM_START = __romPos;
    pictData5_VRAM = ADDR(.pictData5);
    .pictData5 0x80244DA0 : AT(pictData5_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData5_DATA_START = .;
        build/assets/pictData5.bin.o(.data);
        pictData5_DATA_END = .;
        pictData5_DATA_SIZE = ABSOLUTE(pictData5_DATA_END - pictData5_DATA_START);
    }
    __romPos += SIZEOF(.pictData5);
    pictData5_ROM_END = __romPos;
    pictData5_VRAM_END = .;

    pictData6_ROM_START = __romPos;
    pictData6_VRAM = ADDR(.pictData6);
    .pictData6 0x80239260 : AT(pictData6_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData6_DATA_START = .;
        build/assets/pictData6.bin.o(.data);
        pictData6_DATA_END = .;
        pictData6_DATA_SIZE = ABSOLUTE(pictData6_DATA_END - pictData6_DATA_START);
    }
    __romPos += SIZEOF(.pictData6);
    pictData6_ROM_END = __romPos;
    pictData6_VRAM_END = .;

    pictData7_ROM_START = __romPos;
    pictData7_VRAM = ADDR(.pictData7);
    .pictData7 0x80244DA0 : AT(pictData7_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData7_DATA_START = .;
        build/assets/pictData7.bin.o(.data);
        pictData7_DATA_END = .;
        pictData7_DATA_SIZE = ABSOLUTE(pictData7_DATA_END - pictData7_DATA_START);
    }
    __romPos += SIZEOF(.pictData7);
    pictData7_ROM_END = __romPos;
    pictData7_VRAM_END = .;

    pictData8_ROM_START = __romPos;
    pictData8_VRAM = ADDR(.pictData8);
    .pictData8 0x80239260 : AT(pictData8_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictData8_DATA_START = .;
        build/assets/pictData8.bin.o(.data);
        pictData8_DATA_END = .;
        pictData8_DATA_SIZE = ABSOLUTE(pictData8_DATA_END - pictData8_DATA_START);
    }
    __romPos += SIZEOF(.pictData8);
    pictData8_ROM_END = __romPos;
    pictData8_VRAM_END = .;

    pictN64_ROM_START = __romPos;
    pictN64_VRAM = ADDR(.pictN64);
    .pictN64 0x80239260 : AT(pictN64_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        pictN64_DATA_START = .;
        build/assets/pictN64.bin.o(.data);
        pictN64_DATA_END = .;
        pictN64_DATA_SIZE = ABSOLUTE(pictN64_DATA_END - pictN64_DATA_START);
    }
    __romPos += SIZEOF(.pictN64);
    pictN64_ROM_END = __romPos;
    pictN64_VRAM_END = .;

    throphydata_ROM_START = __romPos;
    throphydata_VRAM = ADDR(.throphydata);
    .throphydata 0x8013E4B0 : AT(throphydata_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        throphydata_DATA_START = .;
        build/assets/throphydata.bin.o(.data);
        throphydata_DATA_END = .;
        throphydata_DATA_SIZE = ABSOLUTE(throphydata_DATA_END - throphydata_DATA_START);
    }
    __romPos += SIZEOF(.throphydata);
    throphydata_ROM_END = __romPos;
    throphydata_VRAM_END = .;

    littletracks_ROM_START = __romPos;
    littletracks_VRAM = ADDR(.littletracks);
    .littletracks 0x8013E4B0 : AT(littletracks_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        littletracks_DATA_START = .;
        build/assets/littletracks.bin.o(.data);
        littletracks_DATA_END = .;
        littletracks_DATA_SIZE = ABSOLUTE(littletracks_DATA_END - littletracks_DATA_START);
    }
    __romPos += SIZEOF(.littletracks);
    littletracks_ROM_END = __romPos;
    littletracks_VRAM_END = .;

    mainmenubg_ROM_START = __romPos;
    mainmenubg_VRAM = ADDR(.mainmenubg);
    .mainmenubg 0x8013E4B0 : AT(mainmenubg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        mainmenubg_DATA_START = .;
        build/assets/mainmenubg.bin.o(.data);
        mainmenubg_DATA_END = .;
        mainmenubg_DATA_SIZE = ABSOLUTE(mainmenubg_DATA_END - mainmenubg_DATA_START);
    }
    __romPos += SIZEOF(.mainmenubg);
    mainmenubg_ROM_END = __romPos;
    mainmenubg_VRAM_END = .;

    garagemainbg_ROM_START = __romPos;
    garagemainbg_VRAM = ADDR(.garagemainbg);
    .garagemainbg 0x8013E4B0 : AT(garagemainbg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        garagemainbg_DATA_START = .;
        build/assets/garagemainbg.bin.o(.data);
        garagemainbg_DATA_END = .;
        garagemainbg_DATA_SIZE = ABSOLUTE(garagemainbg_DATA_END - garagemainbg_DATA_START);
    }
    __romPos += SIZEOF(.garagemainbg);
    garagemainbg_ROM_END = __romPos;
    garagemainbg_VRAM_END = .;

    optionsscreenbg_ROM_START = __romPos;
    optionsscreenbg_VRAM = ADDR(.optionsscreenbg);
    .optionsscreenbg 0x8013E4B0 : AT(optionsscreenbg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        optionsscreenbg_DATA_START = .;
        build/assets/optionsscreenbg.bin.o(.data);
        optionsscreenbg_DATA_END = .;
        optionsscreenbg_DATA_SIZE = ABSOLUTE(optionsscreenbg_DATA_END - optionsscreenbg_DATA_START);
    }
    __romPos += SIZEOF(.optionsscreenbg);
    optionsscreenbg_ROM_END = __romPos;
    optionsscreenbg_VRAM_END = .;

    brightnessadjustbg_ROM_START = __romPos;
    brightnessadjustbg_VRAM = ADDR(.brightnessadjustbg);
    .brightnessadjustbg 0x8013E4B0 : AT(brightnessadjustbg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        brightnessadjustbg_DATA_START = .;
        build/assets/brightnessadjustbg.bin.o(.data);
        brightnessadjustbg_DATA_END = .;
        brightnessadjustbg_DATA_SIZE = ABSOLUTE(brightnessadjustbg_DATA_END - brightnessadjustbg_DATA_START);
    }
    __romPos += SIZEOF(.brightnessadjustbg);
    brightnessadjustbg_ROM_END = __romPos;
    brightnessadjustbg_VRAM_END = .;

    loadandsavebg_ROM_START = __romPos;
    loadandsavebg_VRAM = ADDR(.loadandsavebg);
    .loadandsavebg 0x80140450 : AT(loadandsavebg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        loadandsavebg_DATA_START = .;
        build/assets/loadandsavebg.bin.o(.data);
        loadandsavebg_DATA_END = .;
        loadandsavebg_DATA_SIZE = ABSOLUTE(loadandsavebg_DATA_END - loadandsavebg_DATA_START);
    }
    __romPos += SIZEOF(.loadandsavebg);
    loadandsavebg_ROM_END = __romPos;
    loadandsavebg_VRAM_END = .;

    multiplayerbg_ROM_START = __romPos;
    multiplayerbg_VRAM = ADDR(.multiplayerbg);
    .multiplayerbg 0x8013E4B0 : AT(multiplayerbg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        multiplayerbg_DATA_START = .;
        build/assets/multiplayerbg.bin.o(.data);
        multiplayerbg_DATA_END = .;
        multiplayerbg_DATA_SIZE = ABSOLUTE(multiplayerbg_DATA_END - multiplayerbg_DATA_START);
    }
    __romPos += SIZEOF(.multiplayerbg);
    multiplayerbg_ROM_END = __romPos;
    multiplayerbg_VRAM_END = .;

    vsresultbg_ROM_START = __romPos;
    vsresultbg_VRAM = ADDR(.vsresultbg);
    .vsresultbg 0x8013E4B0 : AT(vsresultbg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        vsresultbg_DATA_START = .;
        build/assets/vsresultbg.bin.o(.data);
        vsresultbg_DATA_END = .;
        vsresultbg_DATA_SIZE = ABSOLUTE(vsresultbg_DATA_END - vsresultbg_DATA_START);
    }
    __romPos += SIZEOF(.vsresultbg);
    vsresultbg_ROM_END = __romPos;
    vsresultbg_VRAM_END = .;

    controllerconfigbg_ROM_START = __romPos;
    controllerconfigbg_VRAM = ADDR(.controllerconfigbg);
    .controllerconfigbg 0x8013E4B0 : AT(controllerconfigbg_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        controllerconfigbg_DATA_START = .;
        build/assets/controllerconfigbg.bin.o(.data);
        controllerconfigbg_DATA_END = .;
        controllerconfigbg_DATA_SIZE = ABSOLUTE(controllerconfigbg_DATA_END - controllerconfigbg_DATA_START);
    }
    __romPos += SIZEOF(.controllerconfigbg);
    controllerconfigbg_ROM_END = __romPos;
    controllerconfigbg_VRAM_END = .;

    textureDB_ROM_START = __romPos;
    textureDB_VRAM = ADDR(.textureDB);
    .textureDB 0x0 : AT(textureDB_ROM_START) SUBALIGN(16)
    {
        FILL(0x00000000);
        textureDB_DATA_START = .;
        build/assets/textureDB.bin.o(.data);
        textureDB_DATA_END = .;
        textureDB_DATA_SIZE = ABSOLUTE(textureDB_DATA_END - textureDB_DATA_START);
    }
    __romPos += SIZEOF(.textureDB);
    textureDB_ROM_END = __romPos;
    textureDB_VRAM_END = .;

    /DISCARD/ :
    {
        *(*);
    }
}
