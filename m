Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1JeCu3-0003yh-74
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 18:25:39 +0100
Received: from andromeda (e180141169.adsl.alicedsl.de [85.180.141.169])
	by drlauer-research.com (Postfix) with ESMTP id 6FC4F584C99
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 18:34:04 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Mar 2008 18:26:15 +0100
User-Agent: KMail/1.9.9
References: <d46153c40803200540h522b735cq483a8f510020fe09@mail.gmail.com>
	<20080320210020.1fc57e44@widy.localdomain>
In-Reply-To: <20080320210020.1fc57e44@widy.localdomain>
MIME-Version: 1.0
Message-Id: <200803251826.15557.mickey@vanille-media.de>
Subject: Re: [RFC] ipaq-sleep backlight control
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
X-List-Received-Date: Tue, 25 Mar 2008 17:25:39 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 20 March 2008 20:00:20 Paul Sokolovsky wrote:
> IMHO, ipaq-sleep should go to /dev/null. Long-term, it should be 
> replaced by that mythical "machine daemon" which sometimes appear in
> blogs and ML conversations. Short-time, I wrote another, sane
> and efficient backlight control daemon, packages/backsaver/ in OE.

I fully agree to all points. I'll work on the long-term solution :)

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


