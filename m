Received: from helsinki.digox.de ([87.106.28.129] helo=digox.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NwBSV-0000Vk-QH
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 11:41:00 +0200
Received: from gonzales.localnet by digox.de with esmtp (emil_qGGZo1odWQvr.);
	Mon, 29 Mar 2010 11:33:20 +0200
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 11:33:21 +0200
User-Agent: KMail/1.13.1 (Linux/2.6.32.9-70.fc12.x86_64; KDE/4.4.1; x86_64; ; )
References: <20100329091228.GA4123@denix.org>
In-Reply-To: <20100329091228.GA4123@denix.org>
MIME-Version: 1.0
Message-Id: <201003291133.21827.mok@mnet-online.de>
X-SA-Exim-Connect-IP: 87.106.28.129
X-SA-Exim-Mail-From: mok@mnet-online.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openssl-native is broken?
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
X-List-Received-Date: Mon, 29 Mar 2010 09:41:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Montag, 29. M=E4rz 2010 11:12:28 schrieb Denys Dmytriyenko:
> Is openssl-native broken for anyone else, when built from scratch?
is broken for me too. failing in log.do_stage with

/bin/sh: line 6: /usr/share/man/man1/CA.pl.1ssl: Permission denied


>=20
> I think the conversion to new style staging was not complete/correct for
> the -native part. Koen, can you please check it? Thanks.

=2D-=20
Klaus 'mrmoku' Kurzmann


