Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <acassis@gmail.com>) id 1Gh27G-0001ZL-D3
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Nov 2006 11:54:10 +0100
Received: by ug-out-1314.google.com with SMTP id e2so704206ugf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Nov 2006 02:52:53 -0800 (PST)
Received: by 10.78.157.8 with SMTP id f8mr6572303hue.1162810372810;
	Mon, 06 Nov 2006 02:52:52 -0800 (PST)
Received: by 10.78.194.14 with HTTP; Mon, 6 Nov 2006 02:52:52 -0800 (PST)
Message-ID: <37367b3a0611060252qf813f34y9db9bddb4ae60cb2@mail.gmail.com>
Date: Mon, 6 Nov 2006 08:52:52 -0200
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <B19DF804-070B-4506-A2D4-217EFAEF505E@gmx.net>
MIME-Version: 1.0
References: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>
	<B19DF804-070B-4506-A2D4-217EFAEF505E@gmx.net>
Subject: Re: Problems creating a bitbake package
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
X-List-Received-Date: Mon, 06 Nov 2006 10:54:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Holger,

On 11/5/06, Holger Freyther <freyther@gmx.net> wrote:
>
> because you inherit gpe.bbclass after setting the SRC_URI and the
> SRC_URI will be overwritten. Take a look at the gpe.bbclass
>

Sure, it solve the first one problem.

Do you have some idea to solve these undefined references in libfltk.so:
undefined reference to `XUnsetICFocus'
undefined reference to `XGetIMValues'
undefined reference to `XSetICValues'
undefined reference to `Xutf8LookupString'
undefined reference to `XSetICFocus'
undefined reference to `XVaCreateNestedList'

>
> h.
>

Cheers,

> --
> Holger 'zecke' Freyther
> geek, QA monkey, OpenEmbedded Engineer
>

Alan


