Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfarning@gmail.com>) id 1KVy98-0008JO-2O
	for openembedded-devel@openembedded.org; Thu, 21 Aug 2008 02:35:26 +0200
Received: by py-out-1112.google.com with SMTP id a73so1138731pye.2
	for <openembedded-devel@openembedded.org>;
	Wed, 20 Aug 2008 17:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding:sender;
	bh=r8RNyYI3ZZudjOdij3AYcvzZ/+0GYUF68L5LX1TdiGU=;
	b=yC8NHX9EPYT+GRjWFS/VI8fFYXsiXf/PJfdnVhjKfhbsKh/mzF5COLjRyE2lE/nSTq
	dyexuGSiA4a9eGAGs9ypvLTlCu4zcGcA5pBxIZsecNmFkv2d7Df5Pw3zz2RB/RO6rJBm
	eQwDdIGjc8i70YzncevV5k8Z4QizNi5qJ+QUY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding
	:sender;
	b=vV/RQ12OBSTpOVc3x2K9jQuM3EQ9oD5a7o6iyLHvm8rodU7FQoXNrqpwAySGRXUG2L
	t42Mp6Q8wGIiIZGAv2aRG1ReeVdL6RfdyJrh2qZz/ueNZlQfMnZ0gm9GMgAQSG//kpkA
	np5ZavD227o6cda3SsOdvX4neAspv6e1r9nns=
Received: by 10.65.73.15 with SMTP id a15mr1328377qbl.66.1219278857949;
	Wed, 20 Aug 2008 17:34:17 -0700 (PDT)
Received: from ?192.168.2.3? ( [75.121.143.78])
	by mx.google.com with ESMTPS id 9sm3543047qbw.6.2008.08.20.17.34.16
	(version=SSLv3 cipher=RC4-MD5); Wed, 20 Aug 2008 17:34:17 -0700 (PDT)
From: David Farning <dfarning@sugarlabs.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48AB3572.20804@student.utwente.nl>
References: <1219122247.7224.337.camel@dfarning.desktop.org>
	<48AB3572.20804@student.utwente.nl>
Date: Wed, 20 Aug 2008 19:34:14 -0500
Message-Id: <1219278854.7197.5.camel@dfarning.desktop.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Sender: David Farning <dfarning@gmail.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: Sugar Desktop
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
X-List-Received-Date: Thu, 21 Aug 2008 00:35:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-08-19 at 23:04 +0200, Koen Kooi wrote:
> David Farning wrote:
> > I am wondering if there is interest in creating OE packages for the
> > Sugar desktop [1].  Development of Sugar, which was originally designed
> > for the One Laptop Per Child, has been spun off to Sugar Labs.


> sugar-artwork-0.82.0/cursor/cursorthemegen/.libs/lt-cursorthemegen: 
> cannot execute binary file
> 
> My opterons can't execute ARM code. Could you *please* fix those issues 
> upstream so that every sucrose part cross-compiles cleanly?
> 
Koen,

Would you please file a bug in the tracker at http://dev.laptop.org/ .
We will try to get the situation sorted out.  If You cc me, I will try
to push it along.

thanks
dfarning




