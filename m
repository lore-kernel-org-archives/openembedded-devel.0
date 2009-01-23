Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LQCdl-0000gs-L6
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 04:23:30 +0100
Received: by rv-out-0708.google.com with SMTP id f25so5044609rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2009 19:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OeLHwyb9WCyukYJlU11Ve+UsLS8MB3sWADpdtXaXgpU=;
	b=jzRPXvzESVi1vpYw/rkwK2igFAQJe4ORATHkkzgBmHMDjMsqCTFi6z+j1/3LfR8tW2
	acQlinD8xt0WN25SsXHQppJKADsPjKJby9AcTIFBlaZSaV3MHlWgu0mUZH7Ue7aTQYqp
	1xEMSDU+cYuGjF7n4lE5sbtG3pJLRJ7mqJPBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Vw5Ul905c3dkCAU8Sw5xRfTCQA/yuIYhfaR49g+Axgiix7zQ9L+Y6ePj07l3XToQPm
	up7PJpP0rd8HAAtMRu3WhtM7I3f7LV9wB9ZUVlbryRn78ylnVn+28qmFIy9iuajmuD8g
	IjLdnm2DrX7/Ae9y+4MDLIH5xrd5KuySpC3Ns=
MIME-Version: 1.0
Received: by 10.141.114.15 with SMTP id r15mr733353rvm.179.1232680576431; Thu, 
	22 Jan 2009 19:16:16 -0800 (PST)
In-Reply-To: <8763k6okmx.fsf@neumann.lab.ossystems.com.br>
References: <200901230131.09511.mickey@vanille-media.de>
	<87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
	<49791FCA.4010502@balister.org>
	<8763k6okmx.fsf@neumann.lab.ossystems.com.br>
Date: Thu, 22 Jan 2009 19:16:16 -0800
Message-ID: <19c1b8a90901221916k1d312e5yba7c339b7c4c8e77@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 03:23:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Jan 22, 2009 at 5:51 PM, Otavio Salvador <otavio@debian.org> wrote:
> Philip Balister <philip@balister.org> writes:
>
>>> "Michael 'Mickey' Lauer" <mickey@vanille-media.de> writes:
> <...>
>>>> 2.2.) Remove all software specific bugs that have an upstream and
>>>> are not distribution-relevant, such as GPE, Opie, Kernel, etc.
>>
>> Can we at least markbugs that are upstream issues in such a way that
>> we can track when they are fixed upstream?
>
> I believe that the effort to track what is fixed upstream is too big
> for low gain.
>
> --
>        O T A V I O    S A L V A D O R
> ---------------------------------------------
>  E-mail: otavio@debian.org      UIN: 5906116
>  GNU/Linux User: 239058     GPG ID: 49A5F855
>  Home Page: http://otavio.ossystems.com.br
> ---------------------------------------------
> "Microsoft sells you Windows ... Linux gives
>  you the whole house."
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

We could offloads some stuff (patches) to mailing lists and report
real problems in bugzilla which are not yet fixed and fix is not
available.

-Khem


