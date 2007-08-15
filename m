Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pvamsikris@gmail.com>) id 1ILGz2-0002FJ-AN
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2007 13:24:16 +0200
Received: by ug-out-1314.google.com with SMTP id i24so177447ugd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2007 04:23:52 -0700 (PDT)
Received: by 10.66.224.3 with SMTP id w3mr1362306ugg.1187177032746;
	Wed, 15 Aug 2007 04:23:52 -0700 (PDT)
Received: by 10.66.238.19 with HTTP; Wed, 15 Aug 2007 04:23:52 -0700 (PDT)
Message-ID: <8852460a0708150423j3c6a949bue5b17b379b43e78c@mail.gmail.com>
Date: Wed, 15 Aug 2007 11:23:52 +0000
From: Vamsi <pvamsikris@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Re: BitBake Compilation errors
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
X-List-Received-Date: Wed, 15 Aug 2007 11:24:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

 I could resolve the issue with a different version of bitbake. I was
getting this issue with the bitbake 1.8.2 when i moved on to the
latest one it disappeared.

Thanks,
Vamsi




On 8/15/07, openembedded-devel-request@lists.openembedded.org
<openembedded-devel-request@lists.openembedded.org> wrote:
> Send Openembedded-devel mailing list submissions to
>         openembedded-devel@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> or, via email, send a message with subject or body 'help' to
>         openembedded-devel-request@lists.openembedded.org
>
> You can reach the person managing the list at
>         openembedded-devel-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-devel digest..."
>
>
> Today's Topics:
>
>    1. Re: BitBake Compilation errors (Vamsi)
>    2. Re: BitBake Compilation errors (Richard Purdie)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Wed, 15 Aug 2007 04:10:03 +0000
> From: Vamsi <pvamsikris@gmail.com>
> Subject: Re: [oe] BitBake Compilation errors
> To: openembedded-devel@lists.openembedded.org
> Message-ID:
>         <8852460a0708142110v47dbde97r3478b5c0fbe6b680@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Hi Jim
>  As mentioned in the Getting Started. But one part that missed out is
> the things specific for my distro. I am going to try on that and see.
>
> Thanks
> Vamsi
>
>
>
> ------------------------------
>
> Message: 2
> Date: Wed, 15 Aug 2007 10:53:27 +0100
> From: Richard Purdie <rpurdie@rpsys.net>
> Subject: Re: [oe] BitBake Compilation errors
> To: openembedded-devel@openembedded.org
> Message-ID: <1187171607.6609.20.camel@localhost.localdomain>
> Content-Type: text/plain
>
> Hi,
>
> On Tue, 2007-08-14 at 14:40 +0000, Vamsi wrote:
> >     pd.delDomain("BB_URI_HEADREVS")
> >   File "bitbake-1.8/lib/bb/persist_data.py", line 66, in delDomain
> > AttributeError: 'pysqlite2.dbapi2.Connection' object has no attribute 'execute'
>
> This looks like an old version of python which has a pysqlite2 module
> missing features we use. Which version of python and pysqlite2 is this
> and can you upgrade it?
>
> Regards,
>
> Richard
>
>
>
>
> ------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> End of Openembedded-devel Digest, Vol 13, Issue 28
> **************************************************
>


