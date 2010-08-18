Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olm5Y-0001Wc-T0
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 19:06:10 +0200
Received: by gwb15 with SMTP id 15so294709gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 10:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lkokbdzR9imk2aEKv03dq62PxSZYLc3mZ1a15ZeH7Rs=;
	b=VBg5JlzTvpMXXgBfeEqHNWj6BSXM9nm0TtC+Hco4bfBY9xhXJGTpqdYfDFosCsqiwh
	rY/fx3DMs33TrRFEPh5Qa3+0KtLJQgVHa6RGxyl5bgehzl08xkQWsbRCAvw/yGzhMtNg
	6jpGachlAgCKftBao9oLx4bBSJUOWxRhYyZlc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=G+pD54qhGOvXRnbTsswI6/e579ikvaW7TltVsWIfXqYj28spKMp8i6Op7x1PLWobPF
	9znk0A48o48+3wq5L2xxWtG7QktI4MpP1oFqchXKGJV3/ZOIBU77uIvkbIePn1mM1ehU
	G68PAicfMw95neDawrD5mIFUGRb4B4N3FkHw4=
MIME-Version: 1.0
Received: by 10.150.192.19 with SMTP id p19mr584519ybf.312.1282151148607; Wed,
	18 Aug 2010 10:05:48 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 10:05:48 -0700 (PDT)
In-Reply-To: <AANLkTinytMQ0=hav0GiqPV0S-Avo16-DDFDcEd6QWYhg@mail.gmail.com>
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
	<AANLkTinytMQ0=hav0GiqPV0S-Avo16-DDFDcEd6QWYhg@mail.gmail.com>
Date: Wed, 18 Aug 2010 19:05:48 +0200
Message-ID: <AANLkTinvou+tVwQ683OqsTrRvHJV8HdBfTJOuPiBoK5q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Wed, 18 Aug 2010 17:06:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/18 Jason Kridner <jkridner@beagleboard.org>:
> On Wed, Aug 18, 2010 at 11:07 AM, Cliff Brake <cliff.brake@gmail.com> wro=
te:

>>
>> Getting started
>> (http://wiki.openembedded.net/index.php/Getting_started) points to a
>> tarball for bitbake 1.8.18. =A0Is this still the recommended
>> version/mechanism for new users? =A0I much prefer simply pulling bitbake
>> from git.
>
> Koen pointed me to
> http://gitorious.org/angstrom/angstrom-setup-scripts/blobs/master/oebb.sh
> for setting up my environment. =A0I also prefer pulling bitbake from
> git. =A0Koen seems to be pulling bitbake 1.10, instead of 1.8.18.
>
1.10 is now officially released and is supposed to be better and faster.
I think we should change the wiki page to reflect using 1.10

Frans


