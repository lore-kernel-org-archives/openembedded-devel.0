Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <acassis@gmail.com>) id 1GhO4b-0000OV-Si
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Nov 2006 11:20:53 +0100
Received: by ug-out-1314.google.com with SMTP id e2so978910ugf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Nov 2006 02:19:30 -0800 (PST)
Received: by 10.78.166.7 with SMTP id o7mr8051924hue.1162894770551;
	Tue, 07 Nov 2006 02:19:30 -0800 (PST)
Received: by 10.78.194.14 with HTTP; Tue, 7 Nov 2006 02:19:30 -0800 (PST)
Message-ID: <37367b3a0611070219n3fb80edcva6572bcb8baa993@mail.gmail.com>
Date: Tue, 7 Nov 2006 08:19:30 -0200
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <454F2893.50107@adtelecom.es>
MIME-Version: 1.0
References: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>
	<B19DF804-070B-4506-A2D4-217EFAEF505E@gmx.net>
	<37367b3a0611060252qf813f34y9db9bddb4ae60cb2@mail.gmail.com>
	<454F2893.50107@adtelecom.es>
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
X-List-Received-Date: Tue, 07 Nov 2006 10:20:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Joaquim,

On 11/6/06, Joaquim Duran <joaquinduran@adtelecom.es> wrote:
> Alan,
>
> I think that the library Xext is not installed. The dependency line of
> the file should be similar to:
>
> DEPENDS = "zlib jpeg libpng libxext"
>

Thank you very much.

> Well, I'm trying to build FLTK with support for anti aliased fonts. ASAP
> the build image is created successfully, I'll submit the patch.
>

Sure, good work. Anyway after I will port ipatience to use GTK because
everything in gpe use it and FLTK is not so much used.

Joaquim, do you are a FLTK programmer?

> Thanks and Best Regards,

Cheers,

> Joaquim Duran
>

Alan


