Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LXzny-00025k-Qc
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 16:18:14 +0100
Received: by fk-out-0910.google.com with SMTP id f40so634673fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 07:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=78yzp9jY9qFR+XpxBKLFzrf/KqWqxSZK6Qgw4p0jI/U=;
	b=Y6X3Bb/pAIA7jsy/Isb0ZFE+LQ//VqsUC4PaJuuL+UotpOWy4+LgGg4ZlnJ7093Vwv
	g0Gd0QOGt8xZzTcTIpp6OGphVhkFSCpZprXH/YvIax1lcUg0moixZG7E57sBF6LhnFa4
	yw/aBrXx+MKx0thirww05Rfam78juMOVuH7QM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=ULBqJWEcbM1WO3o3J+N7EySZBsCfTm+7mJO70zB6I+/y9oYNeLgd7GdGjVHUJGsotj
	getnK0aJ+GkGKsOPDcPE6R1ShK/IHFD54fZ2sJyKHIDj6o0rKQJqs9QWpvzKcc0L+zS9
	Joz7Kfn0riai551+BhlEQw8Jb8jaujqqNIO9E=
Received: by 10.86.73.1 with SMTP id v1mr327139fga.52.1234538209185;
	Fri, 13 Feb 2009 07:16:49 -0800 (PST)
Received: from is.home ([93.81.136.171])
	by mx.google.com with ESMTPS id l19sm3021921fgb.47.2009.02.13.07.16.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 13 Feb 2009 07:16:48 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 18:16:43 +0300
User-Agent: KMail/1.9.10
References: <200902131525.34787.openembedded@haerwu.biz>
In-Reply-To: <200902131525.34787.openembedded@haerwu.biz>
MIME-Version: 1.0
Message-Id: <200902131816.43672.jay4mail@gmail.com>
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 15:18:14 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!
> OE developers usually know that machine config is simple but tell that
> to Joe Random who only knows that his board use s3c2443 etc. So idea was
> to create simple few steps wizard which will ask few questions and
> produce machine config as result. More work would be required on
> creating kernel recipe because kernel can be from svn/cvs/git or tarball
> + quilt patchset etc...

We still needed defconfig's management tool :)
Now for make new kernel recipe creating easier (e.g. by selecting known 
devices and drivers).

-- 
Yuri Bushmelev


