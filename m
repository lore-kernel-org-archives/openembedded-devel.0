Received: from [72.14.246.241] (helo=ag-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JRfP0-0005JS-7y
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 04:13:48 +0100
Received: by ag-out-0708.google.com with SMTP id 31so3777881agc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 19:12:53 -0800 (PST)
Received: by 10.100.168.18 with SMTP id q18mr15923422ane.47.1203477173811;
	Tue, 19 Feb 2008 19:12:53 -0800 (PST)
Received: from ?192.168.1.129? ( [71.16.230.132])
	by mx.google.com with ESMTPS id o29sm14495536elf.18.2008.02.19.19.12.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Feb 2008 19:12:52 -0800 (PST)
Message-ID: <47BB9AB1.4040804@gmail.com>
Date: Tue, 19 Feb 2008 22:12:49 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1203419692.21824.35.camel@dax.rpnet.com>
In-Reply-To: <1203419692.21824.35.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 72.14.246.241
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE.dev roadworks notification
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
X-List-Received-Date: Wed, 20 Feb 2008 03:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2008 06:14 AM, Richard Purdie wrote:
> On a similar note, I'll be doing some work on packaged staging over the
> next few weeks. Again, its been agreed that its in the interests of
> OE.dev on many occasions and now I/we have a chance for action which I'm
> planing to make good use of it. 

The following bug (typo) was detected only with INHERIT += 
"packaged-staging2", which is good, however the error message is too 
misleading to decipher. As you are on it, you may want to take a look to 
see if there is a way to provide a saner error message.

http://lists.linuxtogo.org/pipermail/openembedded-commits/2008-January/011276.html

Regards
Gordon


