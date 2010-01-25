Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZKCl-0006j7-Ia for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:21:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZKAU-0000Qv-Hk
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:19:30 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 09:19:30 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 09:19:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 25 Jan 2010 09:19:07 +0100
Message-ID: <hjjk5q$rmc$1@ger.gmane.org>
References: <1264277173.3738.74.camel@mattotaupa.wohnung.familie-menzel.net>	<20100124070602.GA8642@denix.org>
	<hjh7f3$6v0$2@ger.gmane.org> <20100125015636.GA9855@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <20100125015636.GA9855@denix.org>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Official policy to list checksums
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
X-List-Received-Date: Mon, 25 Jan 2010 08:21:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-10 02:56, Denys Dmytriyenko wrote:
> On Sun, Jan 24, 2010 at 11:29:56AM +0100, Koen Kooi wrote:
>> On 24-01-10 08:06, Denys Dmytriyenko wrote:
>>> On Sat, Jan 23, 2010 at 09:06:13PM +0100, Paul Menzel wrote:
>>>> does [1] still describe the official policy to add checksums? Or is
>>>
>>> No
>>>
>>>> putting them into the recipes preferred nowadays?
>>>
>>> Yes
>>
>> I think not! The new format:
>>
>> * is not documented
> 
> I think there were plenty of emails describing the new format. Need to put it 
> all in a Wiki page, agree.

>> * it has no tools to autogenerate it
> 
> Give me few minutes - I'll send something to address this point.
> 
>> * has not been agreed on in any way.
> 
> Actually, specifying checksums in corresponding recipes was agreed on during 
> the OEDEM in November. Using additional variable flags in base.bbclass was 
> added by Phil, since bitbake cannot handle SHA256 sums in SRC_URI. Although, 
> Richard mentioned he'd like to get it implemented in bitbake at some point:
> http://thread.gmane.org/gmane.comp.sysutils.bitbake.devel/1089/focus=1115

Ah yes, stuff agreed at OEDEM, I see. I also remember that nearly
everything that was 'agreed' there got dis-agreed on the mailinglist here.
And I also remember that I said that to be consistent sane-srcrevs
should cease to exist as well :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXVP7MkyGM64RGpERAuV7AJ9ReCKJDujV+1VS0IErq+Ne5sUF/ACdGYID
3/0DqfPuC8O5KmvQORdsipw=
=ukSY
-----END PGP SIGNATURE-----



