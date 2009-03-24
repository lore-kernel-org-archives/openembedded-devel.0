Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LmBo6-0008Ff-7w
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 19:57:02 +0100
Received: by yw-out-1718.google.com with SMTP id 9so1859551ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oE9pCY5pSuJ6cnbiv3dVk/9sDG2/M8rcsmvpWu5rCKg=;
	b=XcRvuJwdqS1tQm/VjclWzETx7V+Ru5s2R/xIUTn64ZFHEMFlqe8HdVrhxlZLV3//Tl
	3sorJUR/7SYXD83iQYl0Wmx8+X96Di2JpUOPfh17+4n/qWZw4bs407fCkZKPdq2knPyF
	GT3ymx1Zgz4AY9i3eb9JdRt8oobd0eP8Kq138=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=gwygPHPKlAw8E88c3S10bEtT+F76rBVK+Wkz38xwsGH5dCkIulMr+IIaeSMIsQ9k/Z
	asOTzdoAAmlIEDLBDafQPJkYWDmZRwV8nXam3oTA/IkC9dakLlcSv90lopAYrNIsBOuW
	8Ob2gik9fOOLn8NPXb8Gm3r9S7IGqVcW1CeJc=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.113.5 with SMTP id q5mr15495394ybm.116.1237920932323; Tue, 
	24 Mar 2009 11:55:32 -0700 (PDT)
In-Reply-To: <ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
Date: Tue, 24 Mar 2009 11:55:32 -0700
X-Google-Sender-Auth: fad338cc9e736174
Message-ID: <b6ebd0a50903241155u7743eaads81be33e350925b7a@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 18:57:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 24, 2009 at 11:36 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Disadvantage of a Maintainers file is that it is yet another file to
> update when you create a package (adjacent to the checksums file and
> of course the package recipe). Guess it will be forgotten regularly.
>
> Also I fear we're going to end up with a lot of orphaned packages.

The point I'm trying to make is that we have a lot of orphaned
packages today, we just aren't being honest about it.  90% of the
recipes in the tree don't get the attention they should.

At least this way, it's quite clear which get individual attention vs
those that get cursory attention by the entire team.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


