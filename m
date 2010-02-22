Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NjcGw-0000t2-Rv
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 18:40:46 +0100
Received: (qmail 10398 invoked by uid 1003); 22 Feb 2010 17:37:51 -0000
Received: from localhost (HELO ?192.168.1.182?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Feb 2010 17:37:50 -0000
Message-ID: <4B82C0EB.3050707@balister.org>
Date: Mon, 22 Feb 2010 09:37:47 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <40d782961002220313y7f90001fmb35315559a7de999@mail.gmail.com>
In-Reply-To: <40d782961002220313y7f90001fmb35315559a7de999@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: omniorb libs are not striped in new recipie
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
X-List-Received-Date: Mon, 22 Feb 2010 17:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/22/2010 03:13 AM, majo huber wrote:
> Hi@all,
>
> we have written a new recipie for a newer version (4.1.4) of omniorb
> than the current one in the openembedded repository (4.0.7).
> Everything works well but the striping of the libs in the normal
> omniorbxxx.ipk package. The libs in the normal omniorbxxx.ipk (not
> -dbg) package are not being striped but the binaries (in /usr/bin).
> That's not what we want...
> Notice: We added the macro m4_pattern_allow(PKG_CONFIG_LIBDIR) to
> configure.ac, since there were an error saying that this should be
> done.
> Could anybody give us a hint, please?

I don't know about the stripping, but thanks for updating the recipe!

Philip


