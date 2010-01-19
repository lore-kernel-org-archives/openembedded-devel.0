Received: from smtp1.cybercity.dk ([212.242.43.251])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NXLgG-00056p-R4 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 22:32:12 +0100
Received: from natla.sgh.dk (0x4dd5bf76.adsl.cybercity.dk [77.213.191.118])
	by smtp1.cybercity.dk (Postfix) with ESMTP id 6D5C358681A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 22:32:55 +0100 (CET)
Received: from phoenix.localnet (phoenix.local [192.168.0.226])
	by natla.sgh.dk (Postfix) with ESMTP id 665826337
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 23:22:25 +0100 (CET)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 22:29:53 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.32-02063204-generic; KDE/4.3.4; i686; ; )
References: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
	<4B55B7E7.70205@mwester.net> <hj566c$1g6$2@ger.gmane.org>
In-Reply-To: <hj566c$1g6$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <201001192229.53778.sgh@sgh.dk>
X-SA-Exim-Connect-IP: 212.242.43.251
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Make perl-native_* depend on make-native.
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
X-List-Received-Date: Tue, 19 Jan 2010 21:32:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tirsdag 19 januar 2010 21:54:35 skrev Rolf Leggewie:
> Mike Westerhof wrote:
> > everything!  I wonder if we can just add a note to the appropriate wiki
> > that in addition to gcc, you need to have make installed on the host.

I guess it was just me over exadurating the thing. It turned out that=20
"rm -rf tmp" solved it for me. Apparently stuff breaks quite easy when
debugging recipes.

Sorry for the inconvinience, and thanks for the effort from all of you.

/S=F8ren Holm


