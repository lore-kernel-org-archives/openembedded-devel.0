Received: from [66.249.82.238] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1HuDkg-0001DA-Hv
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2007 22:29:38 +0200
Received: by wx-out-0506.google.com with SMTP id h29so641163wxd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2007 13:27:45 -0700 (PDT)
Received: by 10.90.105.19 with SMTP id d19mr2255232agc.1180729664874;
	Fri, 01 Jun 2007 13:27:44 -0700 (PDT)
Received: by 10.90.105.6 with HTTP; Fri, 1 Jun 2007 13:27:44 -0700 (PDT)
Message-ID: <a7f8874a0706011327l37177c5btf7b4d259048deea3@mail.gmail.com>
Date: Fri, 1 Jun 2007 13:27:44 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <bdb0025f0706011055g6e50927j97439ee462db7921@mail.gmail.com>
MIME-Version: 1.0
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<1180705209.6390.39.camel@localhost.localdomain>
	<432beae0706010755m47a91208obc66cc688a6f6f90@mail.gmail.com>
	<1180717608.6390.200.camel@localhost.localdomain>
	<bdb0025f0706011055g6e50927j97439ee462db7921@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Fri, 01 Jun 2007 20:29:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 6/1/07, Rodrigo Vivi <rodrigo.vivi@gmail.com> wrote:
>
>
>
> Another idea that I have for the case that you want to build
> everything is an option --dontstop that makes bitbake don't stop when
> a rdepends build fail.


I believe bitbake -k already does this...without the  improved logging of
course

