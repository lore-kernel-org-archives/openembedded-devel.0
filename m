Received: from [64.233.162.236] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hh59U-0003MI-RD
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 16:40:57 +0200
Received: by nz-out-0506.google.com with SMTP id j2so779955nzf
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Apr 2007 07:32:07 -0700 (PDT)
Received: by 10.115.111.1 with SMTP id o1mr620588wam.1177597926616;
	Thu, 26 Apr 2007 07:32:06 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Thu, 26 Apr 2007 07:32:06 -0700 (PDT)
Message-ID: <432beae0704260732j448ddbdfl4155364f62d69c5e@mail.gmail.com>
Date: Thu, 26 Apr 2007 07:32:06 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1177589176.5843.3.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1177589176.5843.3.camel@localhost.localdomain>
Cc: openembedded-devel <openembedded-devel@openembedded.org>,
	bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Bitbake 1.8.2 released!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 14:40:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/26/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> Bitbake 1.8.2 has been released.
>
> http://prdownload.berlios.de/bitbake/bitbake-1.8.2.tar.gz
>
> This release is primarily a bugfix release. It contains several bugfixes
> and minor improvements over the 1.8.0 release and should be used instead
> of 1.8.0 in all cases. Specifically, it addresses several dependency
> problems that were identified in the 1.8.0 release. See the Changelog in
> the release for a more comprehensive list of changes.
>
> Thanks to Holger for the release guide once again.
>

Hmmm...I see no checkins regarding fixing the SRCDATE handling so I'd
have to assume that this release still has this major bug. (which of
course makes bitbake 1.8 unusable)

http://bugs.openembedded.org/show_bug.cgi?id=2133

-- 
Justin Patrin


