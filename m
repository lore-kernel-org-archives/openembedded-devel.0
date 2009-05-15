Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M4spP-0001xj-4o
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 10:31:39 +0200
Received: by ewy20 with SMTP id 20so2172640ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 01:24:41 -0700 (PDT)
Received: by 10.210.11.17 with SMTP id 17mr602442ebk.49.1242375881800;
	Fri, 15 May 2009 01:24:41 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id 23sm1313717eya.59.2009.05.15.01.24.40
	(version=SSLv3 cipher=RC4-MD5); Fri, 15 May 2009 01:24:41 -0700 (PDT)
Message-ID: <4A0D26BB.8010009@xora.org.uk>
Date: Fri, 15 May 2009 09:24:27 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090324 Fedora/3.0-2.1.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
In-Reply-To: <4A0CE800.5040407@dls.net>
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by	default.
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
X-List-Received-Date: Fri, 15 May 2009 08:31:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2009 04:56 AM, Mike Westerhof (mwester) wrote:
>
> I say "sort of expect" because I think they would rather see the
> management of the versions.conf file be done by bitbake.  For example,
> the "bitbake crystallize" command (to choose a name) might do no build
> at all, but just generate, or re-generate, the versions.conf file.  But
> that's a trivial point; they'll have to remember to cp or rm
> versions.conf as necessary themselves.
>
>    
Holger (zecke) wrote exactly this task for openmoko, it is most likely 
still in the openmoko git tree.

Graeme



