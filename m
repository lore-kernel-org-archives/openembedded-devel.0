Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JPMjG-0004lf-JO
	for openembedded-devel@openembedded.org; Wed, 13 Feb 2008 19:53:10 +0100
Received: (qmail 7058 invoked by uid 813007); 13 Feb 2008 18:53:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Feb 2008 18:53:08 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2008 19:53:04 +0100
User-Agent: KMail/1.9.7
References: <E1JPMLs-0004FQ-1W@linuxtogo.org>
In-Reply-To: <E1JPMLs-0004FQ-1W@linuxtogo.org>
MIME-Version: 1.0
Message-Id: <200802131953.05494.openembedded@haerwu.biz>
Subject: Re: [oe-commits] org.oe.dev busybox 1.7.2 enable login utilities to make this a replacement for tinylogin
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
X-List-Received-Date: Wed, 13 Feb 2008 18:53:10 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Wednesday, 13 of February 2008, mickeyl commit napisa=B3:
> busybox 1.7.2 enable login utilities to make this a replacement for
> tinylogin

> packages/busybox/busybox-1.7.2/defconfig

> -CONFIG_FEATURE_EDITING_FANCY_KEYS=3Dy
> +# CONFIG_FEATURE_EDITING_FANCY_KEYS is not set

> -CONFIG_FEATURE_DATE_ISOFMT=3Dy
> +# CONFIG_FEATURE_DATE_ISOFMT is not set

> -CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=3Dy
> +# CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS is not set

Those parts are not related to login...

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                        127.0.0.1, sweet 127.0.0.1




