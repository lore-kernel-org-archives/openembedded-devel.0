Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NvmDt-0003cm-QO
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 08:43:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id CA311A2C3D0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 08:40:36 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id MzkjzmwH7q7o
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 08:40:36 +0200 (CEST)
Received: from tomboy.localnet (pD9E168DE.dip.t-dialin.net [217.225.104.222])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 3EBF9A2C3C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 08:40:36 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Mar 2010 08:40:35 +0200
User-Agent: KMail/1.12.4 (Linux/2.6.33-1.slh.5-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
References: <1269730499.4033.176.camel@mattotaupa>
In-Reply-To: <1269730499.4033.176.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201003280840.35570.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: enna: do_configure failed: automake: unknown warning category `cross'
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
X-List-Received-Date: Sun, 28 Mar 2010 06:43:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Am Samstag 27 M=E4rz 2010 23:54:59 schrieb Paul Menzel:
> Dear OE folks,
>=20
>=20
> I am trying to write the recipe for Enna [1].

There already is a recipe for the svn version of enna, so no need to make a=
=20
new one. Just upgrade the old one:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/e17/enna_sv=
n.bb


