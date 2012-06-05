Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbhTB-0007mn-C5
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 02:17:57 +0200
Received: by wibhm14 with SMTP id hm14so2984337wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2012 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=u3WEL1NjVSxTsTOqSJ7e7j0Ki7KznTT3RmQDJSLxKb0=;
	b=QDtLh/jLzeS/BF3rECOvAt3vcwXRm3jgIBCWaCn/PG0KeHKoOU/GaEQGdSXlpVxIa9
	sEXpkHXV9l0WylokNjG06Z3iUUs+uxzzgyZ6lucqqV/3NOrs4ImGYnSYZVoxm+DaEaNH
	ik0AX1aUHK0k8MUu0dM9Pjzy4RWzvGpRTP0UndKsUNN0m9iJkEzDzwdBscDMyCkVuVDr
	Bz140IuSHQOIlKxLv3vYKvbrGu2/X5LyzbrotlY3yd4OO41SCW/s9chKI6oQwNadN6sM
	QpTa9gkP5jYqTeMDliMjdN+d/fTRWITEj0KpuDDUl1VW6zsxOKW+Ng7U61uY6c5mfYWx
	aBeA==
Received: by 10.216.150.213 with SMTP id z63mr6393892wej.102.1338854852223;
	Mon, 04 Jun 2012 17:07:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Mon, 4 Jun 2012 17:07:02 -0700 (PDT)
In-Reply-To: <8AB41CD7-C6F0-4CD9-812F-1E804F64BCBB@gmail.com>
References: <8AB41CD7-C6F0-4CD9-812F-1E804F64BCBB@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 17:07:02 -0700
Message-ID: <CAMKF1sqqHjVhmV-aNR4cba7oih6yyieZksM66HyLvC53KpY+oA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: How to generate vmlinux kernel image
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
X-List-Received-Date: Tue, 05 Jun 2012 00:17:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 4, 2012 at 4:57 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> KERNEL_IMAGETYPE = "uImage vmlinux"

remove vmlinux from there

> IMAGE_FSTYPES += "ext3 tar.bz2"

that should be ok


