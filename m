Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 795346E7D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 11:00:57 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 016303300ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 12:00:58 +0100 (CET)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0174.001; Thu, 6 Mar 2014 12:00:57 +0100
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Meta java under poky-dora-10.0.1
Thread-Index: Ac85K1ou8F/UCLIgTuOpKrpmTJ/BpQ==
Date: Thu, 6 Mar 2014 11:00:56 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA060AD0D0@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.36]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejuddruddvucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Meta java under poky-dora-10.0.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Mar 2014 11:01:00 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I take poky-dora-10.0.1 and bitbake -k core-image-sato (for beagleboard).

I want to have openjdk7 : I take git meta-java.

But I have the bitbake error :=20
ERROR: Nothing PROVIDES 'giflib' (but /home/toto/poky-dora-10.0.1/meta-java=
/recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb DEPENDS on or otherwise req=
uires it)
ERROR: Required build target 'openjdk-7-jre' has no buildable providers.
Missing or unbuildable dependency chain was: ['openjdk-7-jre', 'giflib']

Did I make an error (ie : don't take the right meta-java)?
Or is it missing something ?

Thanks
Daniel.


