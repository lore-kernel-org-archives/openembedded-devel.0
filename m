Received: from [64.18.0.26] (helo=exprod5og113.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1LcbaH-0003H5-4o
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 09:27:09 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob113.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSaZRl5GT3u8I+kv3hrIrpK1asa8yaGg0@postini.com;
	Thu, 26 Feb 2009 00:23:52 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip05.e2k.ad.ge.com with ESMTP; 26 Feb 2009 03:23:49 -0500
Received: from ind-3n4b83jh1.amer.consind.ge.com (HELO [192.168.219.128])
	([3.138.54.81])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 26 Feb 2009 03:23:50 -0500
Message-ID: <49A651BD.4030007@gefanuc.com>
Date: Thu, 26 Feb 2009 08:24:29 +0000
From: Martyn Welch <martyn.welch@gefanuc.com>
Organization: GE Fanuc Intelligent Platforms Ltd.
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <go498c$bqq$1@ger.gmane.org>
In-Reply-To: <go498c$bqq$1@ger.gmane.org>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 08:27:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Hi,
> 
> I keep trying to teach people the difference between recipes (what's in 
> OE) and packages (what you install on the target) and keep getting 
> reactions like "ok, but why is the dir called packages?", which are 
> completely valid.
> 
> Proposal:
> 
> mv packages recipes ; git commit .
> 

+1

Martyn
-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 729849476


