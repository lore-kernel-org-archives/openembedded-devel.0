Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1ScXat-00065j-B8
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 09:57:23 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1ScXQn-0000M5-7p>; Thu, 07 Jun 2012 09:46:57 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1ScXQn-0002Y2-26>; Thu, 07 Jun 2012 09:46:57 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1ScXQl-00010g-VO
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2012 09:46:56 +0200
Date: Thu, 7 Jun 2012 09:46:55 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120607074655.GA3311@mi.fu-berlin.de>
References: <CALbNGRSJhn0wNvYd_ggvAgbvY6fwXLyuYS3t_GRBi4Gm4_+5Eg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSJhn0wNvYd_ggvAgbvY6fwXLyuYS3t_GRBi4Gm4_+5Eg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: libjpeg8_8d instead of libjpeg-turbo installed
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
X-List-Received-Date: Thu, 07 Jun 2012 07:57:23 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 06, 2012 at 04:23:26PM +0200, Andreas Müller wrote:
> Hi
> 
> does anybody know why libjpeg8_8d instead of libjpeg-turbo is
> installed on my image although Angstrom says
> 
> PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
> PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"
> 
> Andreas

try bitbake -DDD to see why it is choosen.

Bye Henning


