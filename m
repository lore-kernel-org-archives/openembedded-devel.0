Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JQPwd-0003gy-PF
	for openembedded-devel@openembedded.org; Sat, 16 Feb 2008 17:31:21 +0100
Received: (qmail 1581 invoked by uid 813007); 16 Feb 2008 16:30:54 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 16 Feb 2008 16:30:53 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Feb 2008 17:30:35 +0100
User-Agent: KMail/1.9.7
References: <E1JQBXb-0008Gs-HR@linuxtogo.org>
In-Reply-To: <E1JQBXb-0008Gs-HR@linuxtogo.org>
MIME-Version: 1.0
Message-Id: <200802161730.36669.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev devimage 0.1: Up a usb0 on load, now that we're modular.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2008 16:31:21 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Saturday, 16 of February 2008, pfalcon commit napisa=B3:
> devimage 0.1: Up a usb0 on load, now that we're modular.

> +modprobe g_ether
> +ifconfig usb0 192.168.2.202

I am curious when someone will push usb0 to 192.168.3.202... Please use=20
netbase standard: 192.168.0.202 in your recipe.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                 We are the Knights who say: MOVE.L USP,A1




