Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp29K-0001ql-4R
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:23:46 +0100
Received: by qwi2 with SMTP id 2so3120833qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=AlTjlHDFjyxuu5B6GGR+HxYSbHr66Ukgk5esB1LAjdM=;
	b=b68I4cuLsO1gvpkTyPbL2yr2dwZjIuWELUDGUkaGRooUEV6HLC9Ot9l47PinQHs1JE
	ErpAzAr3fMOtOJpgCztk0zCMGP5GJ6FTn8tvnHdE2wRE2rddTtHQwA06RIYb0qSyuYMc
	fh6zHX1JFI7dj5P4KHUZ2F2iiucTQtLdky4LI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=t7zUUqHYEAg6S8xfsDvxOLLd3feU6WlGvoVhRjp+wvaDOFif+HbNx9EiZ+UCBWH7QW
	W0cz2FJJSy9WU0bbvye7fUbIgr5VgvhoHP1S66lx28ZJd93CiI5xja0x9yw1F+OniKsz
	/dBXWLzwoqRPLvegejNHFj+IElOSTiR94Qe6M=
MIME-Version: 1.0
Received: by 10.229.241.194 with SMTP id lf2mr3027364qcb.222.1297704156297;
	Mon, 14 Feb 2011 09:22:36 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Mon, 14 Feb 2011 09:22:36 -0800 (PST)
In-Reply-To: <AANLkTi=7XnywEHPjEReDvY68TNd-3fzr7FtREJ-6hp3T@mail.gmail.com>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<AANLkTi=XjCgstGxtHd2jTmp5Kmm8wyQzOjJrxnnAhJU9@mail.gmail.com>
	<AANLkTikjvqTZcOiYHRsXdE9otGaJTavGKZ8iWtuN7GVu@mail.gmail.com>
	<AANLkTi=7XnywEHPjEReDvY68TNd-3fzr7FtREJ-6hp3T@mail.gmail.com>
Date: Mon, 14 Feb 2011 18:22:36 +0100
Message-ID: <AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Mon, 14 Feb 2011 17:23:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/14/11, Otavio Salvador <otavio@ossystems.com.br> wrote:

> Right but usually we'll have drivers/modules for one, two or three
> vendors that are used or demanded to be supported and then those
> firmware needs to be supported as well.

Can you give an example?
If you are building a distro for a device with USB host - on what
basis do you choose whose products to support?

bye,
Filip Zyzniewski


