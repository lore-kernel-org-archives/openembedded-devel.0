Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pbi5b-0002gk-0u
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 00:20:51 +0100
Received: by pwi8 with SMTP id 8so2605848pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 15:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=tW0shInUs0VQq9sACPyrn/k5HXt5XyKBZZ7ORzsVbH8=;
	b=CuOjl8xf+fnjUapU/4ijmPTIZe282cNHytoxHkaRNtDRPYS1F/LgXQaUmlmQx+QOdU
	p9qPW5NehXZKhtgsVQsLIiw/YRxDKvdQE5tSJVjn2zs2k0VbTTM2dzjwSTVfp5/Y+HUr
	p9uA4rpvqGEdqthZ/bbqPpgJZWPAWojW95g0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=F6j1z6f3a1MdNBEBCm8ihgm4O/4wmqKc8DHDSVl1ZhQnJ40ehvp4lGmH4OM+OcRit0
	H5ELUtEEPzpzQzLfYB3jyXYoZPKB43uFyVdOr5G4Es1VXJiC98ida1xUE0UVqw+KIxxM
	1064hXB9hZ2DRvJRJIksW6baeG3058iS2gZKA=
Received: by 10.142.48.8 with SMTP id v8mr2936985wfv.410.1294528821530;
	Sat, 08 Jan 2011 15:20:21 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm5012153wfd.1.2011.01.08.15.20.20
	(version=SSLv3 cipher=RC4-MD5); Sat, 08 Jan 2011 15:20:20 -0800 (PST)
Message-ID: <4D28F127.5050604@gmail.com>
Date: Sat, 08 Jan 2011 15:20:07 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <00a001cbade1$ea44dee0$bece9ca0$@slingshot.co.nz>
In-Reply-To: <00a001cbade1$ea44dee0$bece9ca0$@slingshot.co.nz>
Subject: Re: Mono recipe fails at do_install
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
X-List-Received-Date: Sat, 08 Jan 2011 23:20:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/2011 12:40 PM, R U Local wrote:
> Dear List,
> I'm working on the Overo branch and just done a git pull to rebuild my
> platform.
> My previous head was 58feb7f form 2010-11-10.
> I'm getting an error in the Mono package build for task do_install.
> The mono-native and mono-mcs-intermediate parts build fine.
> There have been no changes to the mono source or the recipe during this
> time.
>
> Has there been any changes to the way OE  is structured between these
> commits that I should take a look at?
>
> Any help or suggestions would be appreciated.

logs ? any details on what kind of errors ?
>
> Cheers Mike.
>
>
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



