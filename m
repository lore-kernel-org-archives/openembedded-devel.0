Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LAgKW-000506-UX
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 08:51:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LAgGa-0001SJ-0L
	for openembedded-devel@openembedded.org; Thu, 11 Dec 2008 07:47:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 07:47:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Dec 2008 07:47:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Dec 2008 08:47:03 +0100
Message-ID: <ghqgho$r9j$1@ger.gmane.org>
References: <20081210234910.GA16050@excalibur.local>
	<49405BD7.2010801@gmx.de>	<200812110137.01104.mickey@vanille-media.de>
	<4940650B.1000802@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081205 Shredder/3.0b2pre
In-Reply-To: <4940650B.1000802@dls.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Ship dbus config and dbus service activation files
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
X-List-Received-Date: Thu, 11 Dec 2008 07:51:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11-12-08 01:55, Mike (mwester) wrote:
> Michael 'Mickey' Lauer wrote:
>> We can compile it completely without dbus support in a seperate recipe, if
>> that's what you want -- but given the increasing ubiquity of dbus, that
>> doesn't make much sense.
>
> Which raises a point -- there are still devices out there that don't
> want the X11 libraries (due to flash space limitations)

http://www.angstrom-distribution.org/repo/?pkgname=dbus-1
http://www.angstrom-distribution.org/repo/?pkgname=libdbus-1-3

Now where do you see it the _packages_ depending on libx11-6? Is dbus 
going to be the new python where everybody starts screaming about 
requiring X at runtime, when it's only a buildtime dep to build an 
*optional* subpackage like python-tk? Please stop with the FUD.

regards,

Koen



