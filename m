Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1HavL7-0007CI-2A
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 16:59:29 +0200
Received: by an-out-0708.google.com with SMTP id b2so1698462ana
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Apr 2007 07:59:28 -0700 (PDT)
Received: by 10.114.170.1 with SMTP id s1mr2355952wae.1176130767430;
	Mon, 09 Apr 2007 07:59:27 -0700 (PDT)
Received: by 10.115.91.8 with HTTP; Mon, 9 Apr 2007 07:59:27 -0700 (PDT)
Message-ID: <432beae0704090759h4ec56bb8j7b93246ccdc106b@mail.gmail.com>
Date: Mon, 9 Apr 2007 07:59:27 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87abxide9y.fsf@willow.rfc1149.net>
MIME-Version: 1.0
References: <87abxide9y.fsf@willow.rfc1149.net>
Cc: openembedded-devel@openembedded.org
Subject: Re: Using the svn version of a package
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
X-List-Received-Date: Mon, 09 Apr 2007 14:59:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 08 Apr 2007 18:25:29 +0200, Samuel Tardieu <sam@rfc1149.net> wrote:
> Hi.
>
> How can I force bitbake to use the svn version of mplayer?
>

Use PREFERRED_VERSION_mplayer.

-- 
Justin Patrin


