Received: from [72.14.246.250] (helo=ag-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JRfQN-0005LA-4U
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2008 04:15:13 +0100
Received: by ag-out-0708.google.com with SMTP id 31so3778351agc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 19:14:18 -0800 (PST)
Received: by 10.70.57.13 with SMTP id f13mr5319832wxa.84.1203477258334;
	Tue, 19 Feb 2008 19:14:18 -0800 (PST)
Received: from ?192.168.1.129? ( [71.16.230.132])
	by mx.google.com with ESMTPS id h34sm5769769wxd.38.2008.02.19.19.14.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Feb 2008 19:14:17 -0800 (PST)
Message-ID: <47BB9B06.30505@gmail.com>
Date: Tue, 19 Feb 2008 22:14:14 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1203419692.21824.35.camel@dax.rpnet.com>
In-Reply-To: <1203419692.21824.35.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 72.14.246.250
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
X-List-Received-Date: Wed, 20 Feb 2008 03:15:13 -0000
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


