Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvVRH-0005Bj-6Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 15:57:35 +0100
Received: by lahc1 with SMTP id c1so1563312lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 06:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=DJL/NT6/F7ZAKej1mDh1VuZRMaIExfm0RKCi2Bz+fe4=;
	b=dc4Ydy89VasbYHOY//5bmpwIuQoJSZBl0N4shwGlLWkG8zN02+WmLFxo0rjlsrsDGx
	NUwMPUU8iWvTH6MwkN/aSe4TtodNzskW2tmTte5KtdIt2doE26UARG9rjKVtbf9/cDnR
	65cZX1C4JlBVikmNfOcXHN6AD8yqKh7YsdkGQ=
Received: by 10.112.32.1 with SMTP id e1mr736203lbi.3.1328798970429; Thu, 09
	Feb 2012 06:49:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 06:49:00 -0800 (PST)
In-Reply-To: <4F338B5A.2070106@gherzan.ro>
References: <4F33048E.8030109@palm.com> <4F338B5A.2070106@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 06:49:00 -0800
Message-ID: <CAMKF1spVoFnm-72fjiY6p+-xTxXfOQguNXBaSiMqG4TAq5GFbQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake versions
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
X-List-Received-Date: Thu, 09 Feb 2012 14:57:35 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2012 at 1:01 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> I just finished a core-image-minimal + some other packages using bitbake
> form git, branch master. So i don't think that there a problem with bitbake
> in your case. What error you encountered? What is your system shell? Hope
> bash.

You are using oe-core he is using oe classic.


