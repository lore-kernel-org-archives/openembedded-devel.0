Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PV4N8-0004w1-Rf
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 16:43:50 +0100
Received: by wyb40 with SMTP id 40so4130335wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 07:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=joV9E/6j1SATnLtEiQItkrv1EfiruuZuYY0NUCJHHe8=;
	b=NBxZQAyxfG9HKPlv/LN8RrppL1uQ2NszCUJVfR+xoW/v8QZ5/biHts98IM7it2rUvO
	+cObxaCbrDbTNY/F5dl/cjxp8tEXR/oMpWeZWtFNW+X/N8Jb5OPpQQ6ASo72rADr48he
	rL+9pBa6dYzSAb3JcYzpT171coCRJsYT9F0Hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=E98gzsTyd64nPMqLx6I4DctagjDHZ88JQP1el0kew4y60YYLnOdjn1LaQfpB7BeEo0
	82C6fQl0J34plj++ayrOKYHHJNYil8b6AJtLSz+FZmSFajoTFiuzltd5rFQ9CAkxsxOW
	x+TfUCGoW+egx88nS+KGu0lwi6WMvH8ifHCoo=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr6405069wel.4.1292946187317; Tue,
	21 Dec 2010 07:43:07 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Tue, 21 Dec 2010 07:43:07 -0800 (PST)
In-Reply-To: <ienu66$5gf$1@dough.gmane.org>
References: <ienu66$5gf$1@dough.gmane.org>
Date: Tue, 21 Dec 2010 10:43:07 -0500
Message-ID: <AANLkTikyHnG0dxxRt=hsvk3ry_kHfqa1b6ND++3n1nhQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Tue, 21 Dec 2010 15:43:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 20, 2010 at 10:53 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> I've locally split
> http://gitorious.org/angstrom/angstrom-layers/commits/master into 3
> seperate git repos with git-filter-branch. I would like to move the
> meta-openembedded layer to the OE git server to make it easier for
> others to help in cleaning it up and getting more use to layers.

git@git.openembedded.org:meta-openembedded is now available.  Note,
someone will need to push something to it before it exists.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


