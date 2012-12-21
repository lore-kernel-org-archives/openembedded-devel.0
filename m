Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1Tm4wT-00058y-OM
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 16:55:32 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so2547197eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=gCOLktKC5sCk6zwcy1F1RpVFcD54rC7zhG8gGlUB3k8=;
	b=wFV3va87le4oaDegsDnnttaxpscSGhEHwWhfnOghhl/yxJJs0feMds6+lzVXW/ocT5
	50kuSsUFTE/OJ07fiufiUM/yYsD8SjPjLxTw1FopooBRUO8Y//KBQv1fysxix71hr6jh
	eU9411MVcx9twmsh4QzxP4s+NuEJJ5WNvLhrxksG76auhNyXfUTK9j8IAcEtvuTKQZRd
	jIpWYmHX6iI6gDNHVq9VRktWe5gYCnuVU6IkFRMLqnVZnx6SyIfBYh3bIk2J+4qnJroL
	aEpyqn0IGMDM3Aoq6KJ/XUBgIq5d/ow8hng9b5YYoD5IP7SQnPnhB/BIdHLwMhQdxNLG
	pCAg==
MIME-Version: 1.0
Received: by 10.14.203.8 with SMTP id e8mr33057761eeo.2.1356104435777; Fri, 21
	Dec 2012 07:40:35 -0800 (PST)
Received: by 10.14.53.5 with HTTP; Fri, 21 Dec 2012 07:40:35 -0800 (PST)
In-Reply-To: <CANmVirjmVO0XS5E4-_E_=cp02MCY-WQKUHnGEMtYfddEFmewZg@mail.gmail.com>
References: <CANmVirjmVO0XS5E4-_E_=cp02MCY-WQKUHnGEMtYfddEFmewZg@mail.gmail.com>
Date: Fri, 21 Dec 2012 16:40:35 +0100
Message-ID: <CAC+thW3qevdRqc6ftctRG8+i85LeOW+Y8EmpZ2VLiKJdU0ABKQ@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: llvm2.9 install error
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
X-List-Received-Date: Fri, 21 Dec 2012 15:55:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Raul,

On Fri, Dec 21, 2012 at 1:26 PM, Raul Rosetto Munoz
<munoz0raul@gmail.com> wrote:
> Hello all,
>
> I want install openjdk-6-jre in my imx28evk.
>
> I have this error when I try install llvm2.9 in my core-image-minimal.
>
> At bitbake core-image-minimal:
>
> This is the log error:
>
> NOTE: Checking Package: libllvm-llvmipo
> NOTE: Checking Package: libllvm-gtest
> NOTE: Checking Package: libllvm-gtest-main
> ERROR: QA run found fatal errors. Please consider fixing them.
> DEBUG: Python function do_package_qa finished
> DEBUG: Python function do_package finished
> ERROR: Function failed: do_package_qa
>
> Some one can help me?

What version of the build system? What's your layers setup?


> Thanks.
>
> --
> *Raul Rosetto Mu=F1oz*
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


