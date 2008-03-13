Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JZll3-0003pZ-Lo
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 12:38:04 +0100
Received: (qmail 12463 invoked by uid 813007); 13 Mar 2008 11:35:52 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Mar 2008 11:35:52 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Mar 2008 12:35:45 +0100
User-Agent: KMail/1.9.9
References: <47D71B8F.1030108@balister.org> <fraqbd$k6k$2@ger.gmane.org>
	<74d0deb30803130427t16a2ac03r37732dcc08d4d443@mail.gmail.com>
In-Reply-To: <74d0deb30803130427t16a2ac03r37732dcc08d4d443@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200803131235.46794.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 11:38:04 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Thursday 13 of March 2008, pHilipp Zabel napisa=B3:
> Unrelated to the SCM discussion, do we need those empty directories at
> all?

> ./packages/netbase/netbase/if-up.d
> ./packages/netbase/netbase/if-pre-up.d
> ./packages/netbase/netbase/if-post-down.d
> ./packages/netbase/netbase/if-down.d

Can be created by recipe.

> ./packages/netbase/netbase/ghi270

To be removed rather.

> Except for the netbase directories, they look like leftovers to me.

Leftovers or can be created in recipe.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                    Resistance Is Useless! (If < 1 ohm)




