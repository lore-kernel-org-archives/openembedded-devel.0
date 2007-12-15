Received: from [209.85.198.189] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <raj.khem@gmail.com>) id 1J3Nb6-0002BE-11
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 04:21:52 +0100
Received: by rv-out-0910.google.com with SMTP id c24so1115652rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2007 19:17:16 -0800 (PST)
Received: by 10.141.161.6 with SMTP id n6mr2420959rvo.201.1197688636824;
	Fri, 14 Dec 2007 19:17:16 -0800 (PST)
Received: by 10.141.172.11 with HTTP; Fri, 14 Dec 2007 19:17:16 -0800 (PST)
Message-ID: <19c1b8a90712141917x7c0e1676g4fee4e3154bbf9d5@mail.gmail.com>
Date: Fri, 14 Dec 2007 19:17:16 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <164348748.20071215043923@gmail.com>
MIME-Version: 1.0
References: <164348748.20071215043923@gmail.com>
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
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
X-List-Received-Date: Sat, 15 Dec 2007 03:21:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I agree we should make it global.

On Dec 14, 2007 6:39 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello Openembedded-devel,
>
>    ANGSTROM_MODE config variable has proven to be very useful and
> successful feature during the Angstrom evolution. IMHO, it is worth
> generalization of its meaning and naming to become a generic
> additional OE distro configuration parameter. So, I'd like to propose
> it to be renamed to SYSTYPE, with the description "Select particular
> system variant of a distribution which supports such feature, e.g.,
> underlying libc type."
>
>   Obviously, it wouldn't be limited to libc type, but intended to be a
> generic sub-parameter of a distro, it could be debug/release type,
> size type (minimal/standard/extended), whatever. The usage idea is to
> have standard name for such generic parameter, plus semantically it
> should be expected that a distro allows to build different SYSTYPE's
> side-by-side in the same build dir (like Angstrom does for libc
> variants).
>
>
> --
> Best regards,
>  Paul                          mailto:pmiscml@gmail.com
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


