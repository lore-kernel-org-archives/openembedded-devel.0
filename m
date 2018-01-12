Return-Path: <Jose.DiazdeGrenu@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.8])
	by mail.openembedded.org (Postfix) with ESMTP id 583F5786FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 11:54:03 +0000 (UTC)
Received: from [216.82.251.44] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-8.bemta-12.messagelabs.com id 7C/9E-02572-DD1A85A5;
	Fri, 12 Jan 2018 11:54:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRWlGSWpSXmKPExsXi5LtOQPfOwog
	og8sntCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz+yQdYCg4bVvy6f5axgfGrThcjJ4eQwGpG
	ic2tGRD2GkaJW7tkuhi5gOwljBKPunezgCTYBMwlph0+CGaLCMRILD1/ng3EFhaIlXh+aStUP
	Eli8o1GKFtPYvWHLWA1LAKqEvu2TGUEsXkFfCVa1y4CizMKyEqsPH8aLM4sIC5x68l8JhBbQk
	BAYsme88wQtqjEy8f/WCFseYlX544wQdTnSfxeNQdqpqDEyZlPWCAeUJNomzOBeQKj0CwkY2c
	haZmFpAUiriOxYPcnNghbW2LZwtfMMPaZA4+ZkMUXMLKvYtQoTi0qSy3SNTbQSyrKTM8oyU3M
	zNE1NDTSy00tLk5MT81JTCrWS87P3cQIjJd6BgbGHYy///seYpTkYFIS5d2THh4lxJeUn1KZk
	VicEV9UmpNafIhRhoNDSYJ3wYKIKCHBotT01Iq0zBxg5MKkJTh4lER4J4OkeYsLEnOLM9MhUq
	cY7TmaHjxoY+bY8uglkDwAJm+8eN3GLMSSl5+XKiXOuwGkTQCkLaM0D24oLNFcYpSVEuZlZGB
	gEOIpSC3KzSxBlX/FKM7BqCTM+3U+0BSezLwSuN2vgM5iAjrr/MZQkLNKEhFSUg2M9RP9Zbs3
	++35FVjRmc4Qfa9puVH0gWz14yby1cJO7v84t7hPfR/Vk5X+2dpX+cq2eH0/m4pPG49lum3M8
	Pev3n/4zS2207GBOcvZJGadWlp2/duiP7oPRdc5nQ9ojZsuV1e17cDv23cNp5+1LTq285zgX8
	tLazwMT7bG/7h+vZdtH2/h3FoLJZbijERDLeai4kQAh4t/xS8DAAA=
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-16.tower-200.messagelabs.com!1515758044!46315898!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10992 invoked from network); 12 Jan 2018 11:54:04 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-16.tower-200.messagelabs.com with SMTP;
	12 Jan 2018 11:54:04 -0000
Received: from MTK-SMS-XCH04.digi.com (10.10.8.198) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 12 Jan 2018 05:54:00 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH04.digi.com
	(10.10.8.198) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 12 Jan 2018 05:54:01 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Fri, 12 Jan 2018 12:53:57 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] enviornment-setup.d conflict nativesdk-cmake and
	nativesedk-qtbase-tools
Thread-Index: AdOLmXcvphQ3vSc3R9SSIGCDrK7mWg==
Date: Fri, 12 Jan 2018 11:53:56 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01B6F7F7@dor-sms-xch01.digi.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.93]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] enviornment-setup.d conflict nativesdk-cmake and nativesedk-qtbase-tools
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
X-List-Received-Date: Fri, 12 Jan 2018 11:54:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am using Yocto 2.4 Rocko and  trying to populate_sdk my image that includ=
e the meta-qt5 layer. Unfortunately I get the following error while creatin=
g the SDK:

file (...)/sysroots/x86_64-deysdk-linux/environment-setup.d conflicts betwe=
en attempted installs of nativesdk-cmake-3.8.2-r0.0.x86_64_nativesdk and na=
tivesdk-qtbase-tools-5.9.3+git0+73573fce29-r0.0.
x86_64_nativesdk

I had a look at those recipies and this is what I find:

cmake_3.8.2 (from poky, rocko)

do_install_append_class-nativesdk() {
    mkdir -p ${D}${datadir}/cmake
    install -m 644 ${WORKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/

    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
    install -m 644 ${WORKDIR}/environment.d-cmake.sh ${D}${SDKPATHNATIVE}/e=
nvironment-setup.d/cmake.sh
}


nativesdk-qtbase_git.bb (from meta-qt5, rocko):

fakeroot do_generate_qt_environment_file() {
    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
    script=3D${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
(...)
}

Both recipes are installing the directory ${D}${SDKPATHNATIVE}/environment-=
setup.d/. Not sure why that is a conflict. Could it be because qtbase is ru=
nning that as fakeroot?

I checked that in Yocto 2.2 Morty, the recipes do the same but I don't get =
the error. I am not sure if this is because Yocto 2.4 is more strict.

Does this mean this is broken upstream then, or am I missing something?

Thanks.

