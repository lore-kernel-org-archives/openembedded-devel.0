Return-Path: <idealsim@laposte.net>
Received: from smtp.laposte.net (smtpoutz27.laposte.net [194.117.213.102])
	by mail.openembedded.org (Postfix) with ESMTP id B4CE27822D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 17:17:07 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout015 (Postfix) with ESMTP id E38F81CC6E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1502990227; bh=Q5ubxx3syAfwvaCaxgTVVEUuf0nrMRQJDrZ2uUs2ikw=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=Ui3gejquY/YYFA2eshX5lOc+CcSNkruZ1Liqnir2AVshe9KCMeKxlsho0q8h3MjDC
	wZPqBZTfDtRXgaJ6gaKmt9dyg13kBWSlDimj/ptWEDFyKOpEyvv/tYqfxbbtp1X69g
	tCZ9rVapniM91HFWvG9i4HmGFLY7tfXbnxNliMX/7zGYgkDSuaquE7ervLzjjXRXlo
	xqJp8KQAapPggtGyrWvhXRdLITC3DOasKp/UTM4ndzz6AQFAVeyM5efzf8phJafgJb
	XlNgF/mS7n+AKr2OyxJsglhMS+1sozuAAt9GTWqcsChFV2Vs1zOLNStV6ycs71rZag
	DpmeAtiEplolg==
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout015 (Postfix) with ESMTP id D36411CC709
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:17:07 +0200 (CEST)
Received: from lpn-prd-vrin001 (lpn-prd-vrin001.prosodie [10.128.63.2])
	by lpn-prd-vrout015 (Postfix) with ESMTP id CA4ED1CC6E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:17:07 +0200 (CEST)
Received: from lpn-prd-vrin001 (localhost [127.0.0.1])
	by lpn-prd-vrin001 (Postfix) with ESMTP id BAE4D36AE99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 19:17:07 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-262-25.w2-13.abo.wanadoo.fr
	[2.13.73.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin001 (Postfix) with ESMTPSA id 6551B36AF0F;
	Thu, 17 Aug 2017 19:17:02 +0200 (CEST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <b53934ef-2480-8d0e-27ce-fe2fc1eb4d39@laposte.net>
	<CA+chaQdv1yxXbfJpd7mucwn0xHiW2XXZJPUA8s=Q_sqeeDAatw@mail.gmail.com>
From: idealsim <idealsim@laposte.net>
Message-ID: <3cc0f599-db7c-3ed7-908d-d49372b0001c@laposte.net>
Date: Thu, 17 Aug 2017 19:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdv1yxXbfJpd7mucwn0xHiW2XXZJPUA8s=Q_sqeeDAatw@mail.gmail.com>
X-VR-SrcIP: 2.13.73.25
X-VR-FullState: 0
X-VR-Score: -100
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedruddtuddguddtlecutefuodetggdotefrodftvfcurfhr
X-VR-Cause-2: ohhfihhlvgemucfntefrqffuvffgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghn
X-VR-Cause-3: thhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgesrgdtreertdefjeenucfhrhhomhep
X-VR-Cause-4: ihguvggrlhhsihhmuceoihguvggrlhhsihhmsehlrghpohhsthgvrdhnvghtqeenucffohhmrghinhep
X-VR-Cause-5: tghorhgvpghmohguuhhlvgdrphhrohdpmhgsvgguuggvugdrohhrghdpohhpvghnvghmsggvugguvggu
X-VR-Cause-6: rdhorhhgnecukfhppedvrddufedrjeefrddvheenucfrrghrrghmpehmohguvgepshhmthhpohhuthdp
X-VR-Cause-7: hhgvlhhopegludelvddrudeikedruddrudelngdpihhnvghtpedvrddufedrjeefrddvhedpmhgrihhl
X-VR-Cause-8: fhhrohhmpehiuggvrghlshhimheslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopehmrghrthhinhdr
X-VR-Cause-9: jhgrnhhsrgesghhmrghilhdrtghomh
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [qtwebengine] build failed in pyro branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Aug 2017 17:17:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks, this is the reason. Increase swap +4gb solve the problem ...

regards,

Mickaël

Le 14/08/2017 à 16:14, Martin Jansa a écrit :
> >> //| collect2: fatal error: ld terminated with signal 9 [Killed]//
>
> You've probably run out of memory and OOMK killed the linker.
>
> Try with bigger swap or switch from bfd to gold.
>
> On Mon, Aug 14, 2017 at 3:26 PM, idealsim <idealsim@laposte.net 
> <mailto:idealsim@laposte.net>> wrote:
>
>     Hi all, i'm trying to build webengine in pyro branch but i have
>     this error during the build :
>
>     /| ERROR: oe_runmake failed//
>     //| make[3]: Entering directory
>     '/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core/api'//
>     //| compiling
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qtwebenginecoreglobal.cpp//
>     //| compiling
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebenginecookiestore.cpp//
>     //| compiling
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestinfo.cpp//
>     //| compiling
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestjob.cpp//
>     //| compiling
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlschemehandler.cpp//
>     //| generating .moc/moc_predefs.h//
>     //| moc
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebenginecookiestore.h//
>     //| moc
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestinterceptor.h//
>     //| moc
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlrequestjob.h//
>     //| moc
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/api/qwebengineurlschemehandler.h//
>     //| compiling .moc/moc_qwebenginecookiestore.cpp//
>     //| compiling .moc/moc_qwebengineurlrequestinterceptor.cpp//
>     //| compiling .moc/moc_qwebengineurlrequestjob.cpp//
>     //| compiling .moc/moc_qwebengineurlschemehandler.cpp//
>     //| rm -f Release/libqtwebenginecoreapi.a//
>     //| arm-poky-linux-gnueabi-ar cqs Release/libqtwebenginecoreapi.a
>     .obj/qtwebenginecoreglobal.o .obj/qwebenginecookiestore.o
>     .obj/qwebengineurlrequestinfo.o .obj/qwebengineurlrequestjob.o
>     .obj/qwebengineurlschemehandler.o .obj/moc_qwebenginecookiestore.o
>     .obj/moc_qwebengineurlrequestinterceptor.o
>     .obj/moc_qwebengineurlrequestjob.o
>     .obj/moc_qwebengineurlschemehandler.o//
>     //| make[3]: Leaving directory
>     '/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core/api'//
>     //| ( test -e Makefile.core_module ||
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-native/usr/bin/qt5/qmake
>     -o Makefile.core_module
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/git/src/core/core_module.pro
>     <http://core_module.pro> GYP_CONFIG+=use_system_yasm
>     GYP_CONFIG+=generate_character_data=0
>     WEBENGINE_CONFIG+=use_system_flac
>     WEBENGINE_CONFIG+=use_system_libevent
>     WEBENGINE_CONFIG+=use_system_libwebp
>     WEBENGINE_CONFIG+=use_system_libxslt
>     WEBENGINE_CONFIG+=use_system_speex
>     'QMAKE_CXX=arm-poky-linux-gnueabi-g++  -march=armv7-a -marm
>     -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9
>     --sysroot=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot'
>     'QMAKE_CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -marm
>     -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9
>     --sysroot=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot'
>     'QMAKE_LINK=arm-poky-linux-gnueabi-g++  -march=armv7-a -marm
>     -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9
>     --sysroot=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot'
>     'QMAKE_CFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
>     -fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0=/usr/src/debug/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0
>     -fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-native=
>     -fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot=
>     ' 'QMAKE_CXXFLAGS= -O2 -pipe -g -feliminate-unused-debug-types
>     -fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0=/usr/src/debug/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0
>     -fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot-native=
>     -fdebug-prefix-map=/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/recipe-sysroot=
>     -fvisibility-inlines-hidden' 'QMAKE_AR=arm-poky-linux-gnueabi-ar
>     cqs' -after ) && make -f Makefile.core_module//
>     //| make[3]: Entering directory
>     '/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core'//
>     //| creating linker version script QtWebEngineCore.version//
>     //| rm -f libQt5WebEngineCore.so.5.8.0 libQt5WebEngineCore.so
>     libQt5WebEngineCore.so.5 libQt5WebEngineCore.so.5.8//
>     //| linking ../../lib/libQt5WebEngineCore.so.5.8.0//
>     //| collect2: fatal error: ld terminated with signal 9 [Killed]//
>     //| compilation terminated.//
>     //| Makefile.core_module:157: recipe for target
>     '../../lib/libQt5WebEngineCore.so.5.8.0' failed//
>     //| make[3]: *** [../../lib/libQt5WebEngineCore.so.5.8.0] Error 1//
>     //| make[3]: Leaving directory
>     '/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core'//
>     //| Makefile:158: recipe for target
>     'sub-core_module-pro-make_first' failed//
>     //| make[2]: *** [sub-core_module-pro-make_first] Error 2//
>     //| make[2]: Leaving directory
>     '/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src/core'//
>     //| Makefile:49: recipe for target 'sub-core-make_first' failed//
>     //| make[1]: *** [sub-core-make_first] Error 2//
>     //| make[1]: Leaving directory
>     '/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/build/src'//
>     //| Makefile:44: recipe for target 'sub-src-make_first' failed//
>     //| make: *** [sub-src-make_first] Error 2//
>     //| ERROR: Function failed: do_compile (log file is located at
>     /media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtwebengine/5.8.0+gitAUTOINC+d740d6a7db_15d257fd92-r0/temp/log.do_compile.30193)//
>     //ERROR: Task
>     (/media/modjo/data1TO/yocto/pyro/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile)
>     failed with exit code '1'//
>     //NOTE: Tasks Summary: Attempted 6306 tasks of which 6175 didn't
>     need to be rerun and 1 failed.//
>     //
>     //Summary: 1 task failed://
>     ///media/modjo/data1TO/yocto/pyro/sources/meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile//
>     //Summary: There was 1 WARNING message shown.//
>     //Summary: There were 2 ERROR messages shown, returning a non-zero
>     exit code./
>
>     an idea where is the issue ?
>
>     regards
>
>     Mickaël
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


