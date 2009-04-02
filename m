Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LpFXv-0003o6-4j
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Apr 2009 07:33:01 +0200
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 7D849E080E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 07:30:33 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 61593E080E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 07:30:31 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 2B4421840CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2009 07:30:31 +0200 (CEST)
Message-ID: <49D44D76.7070808@bolloretelecom.eu>
Date: Thu, 02 Apr 2009 07:30:30 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1238607343.27167.1.camel@homestead>
In-Reply-To: <1238607343.27167.1.camel@homestead>
X-SA-Exim-Connect-IP: 212.27.42.6
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Apr 2009 05:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Shane Dixon wrote:
> I'm considering changing my projects over to cmake, but before I do, I
> wanted to ask how good the cmake support is in OE.  I saw a recent
> proposal to allow out-of-tree builds for cmake, but I'm not sure if tha=
t
> happened or not.

At work we recently switched our projects over to CMake and they are buil=
ding happily in
OE. Out-of-tree builds are indeed supported, see recipes/llvm/llvm.inc fo=
r an example.

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


