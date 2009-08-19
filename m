Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Mdfat-0006Ta-K1
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 09:28:30 +0200
Received: by ey-out-1920.google.com with SMTP id 3so875696eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 00:11:18 -0700 (PDT)
Received: by 10.210.91.7 with SMTP id o7mr1713698ebb.39.1250665878882;
	Wed, 19 Aug 2009 00:11:18 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id 7sm2486338eyb.20.2009.08.19.00.11.18
	(version=SSLv3 cipher=RC4-MD5); Wed, 19 Aug 2009 00:11:18 -0700 (PDT)
Message-ID: <4A8BA586.9010303@xora.org.uk>
Date: Wed, 19 Aug 2009 08:11:02 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8B9F24.80804@dresearch.de>
In-Reply-To: <4A8B9F24.80804@dresearch.de>
Subject: Re: svn HEAD revision in SRV_URI?
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
X-List-Received-Date: Wed, 19 Aug 2009 07:28:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Is it possible to use always the HEAD revision of an svn repo as SRC_URI?
>
> It is clear to me that this is not very useful in productive builds. But we want to make nightly builds and regression tests on the most up to date sources.
>
>   
SRCREV = "${AUTOREV}"

G



