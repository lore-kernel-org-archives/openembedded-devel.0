Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNUd7-0002Fd-05
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:08:42 +0100
Received: by ywt2 with SMTP id 2so2964641ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=uqYWGnP4N1fBV4r0n32qr3AmTV5dkl53vuRb2rg1NYs=;
	b=seDGwwfhhbFPbx6+RnsI2vR2i+D/adNY7KRlDLVN0+9rdKUqPWjDrvOlEDsjhexJ1u
	6EVQa0e54EcZluNqkg+D4wFGRNfnszcqP31mRe+1XSebQWnQAqPkhDPPzHSVp6zLxkGV
	PYk8krmxcDVJhcI72K0SjfybaAnr5UYie9L94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=bfuL0Z4R88Gv7NA3aKt/xmLEGJEg67cP8znLusO30M/Y+3yv3PQXmidte/mgyBttx8
	/eCqWDPLY+KVBi3s4cHC2FqMgEZ76KSrYbKGnVi3Yz1YhvT3Iyf6rvOx579M8f+jWzX3
	q+GQpURI+wGOJgBNI0NLJujMk52pevZPRWo1w=
Received: by 10.90.9.22 with SMTP id 22mr62945agi.102.1291140439416; Tue, 30
	Nov 2010 10:07:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 10:06:58 -0800 (PST)
In-Reply-To: <4CF49A3B.400@eukrea.com>
References: <ico541$f8$1@dough.gmane.org>
	<1290952831-12085-1-git-send-email-eric@eukrea.com>
	<icvtl2$4pb$1@dough.gmane.org>
	<AANLkTimOybgRmUYFmJXQEaZMDx9vbf=b3KzxLgv10WPu@mail.gmail.com>
	<4CF49A3B.400@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 10:06:58 -0800
Message-ID: <AANLkTi=S0fnne4_r+Z_4XGUrRoVO7tYNQmbF2R1ch5sg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] add task-qt4-x11 and qt4-x11 base & demo images
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
X-List-Received-Date: Tue, 30 Nov 2010 18:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2010 at 10:31 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> can you please cherry pick
> cb0419cc5fbf3ddf147d689e027a3fe83d368a3e
> 3bd272a80f647987f0dff52b842da93773bf3903
>
> to have the qt4-x11 images in the release ?
>
>

done


