Received: from smtprelay0176.hostedemail.com ([216.40.44.176]
	helo=smtprelay.hostedemail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paul@paulwilsonconsulting.com>) id 1NYYz1-0005Zd-42
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 06:56:34 +0100
Received: from smtprelay.hostedemail.com (ff-bigip1 [10.5.19.254])
	by smtpgrave03.hostedemail.com (Postfix) with ESMTP id E73081BE0CF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 18:38:08 +0000 (UTC)
Received: from filter.hostedemail.com (ff-bigip1 [10.5.19.254])
	by smtprelay02.hostedemail.com (Postfix) with SMTP id 570E5116BE9E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 18:38:07 +0000 (UTC)
X-Panda: scanned!
X-Session-Marker: 7061756C407061756C77696C736F6E636F6E73756C74696E672E636F6D
X-Filterd-Recvd-Size: 1370
Received: from [192.168.3.50] (xplr-ts-v10-208-114-133-133.barrettxplore.com
	[208.114.133.133])
	(Authenticated sender: paul@paulwilsonconsulting.com)
	by omf01.hostedemail.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 18:38:01 +0000 (UTC)
Message-ID: <4B55FC07.3080504@paulwilsonconsulting.com>
Date: Tue, 19 Jan 2010 11:37:59 -0700
From: Paul Wilson <paul@paulwilsonconsulting.com>
Organization: Paul Wilson Consulting
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US;
	rv:1.9.1.5) Gecko/20091204 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<1263888546.2678.17.camel@ubuntu-desktop>
In-Reply-To: <1263888546.2678.17.camel@ubuntu-desktop>
X-SA-Exim-Connect-IP: 216.40.44.176
X-SA-Exim-Mail-From: paul@paulwilsonconsulting.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: git pull
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
X-List-Received-Date: Sat, 23 Jan 2010 05:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am having the same problem as Robin. Any suggestions?

Paul


On 19/01/2010 1:09 AM, robin wrote:
> One more input, When i use
> git pull
> Already up-to-date.
>
> and when i use
> git pull --rebase
> recipes/ti/ti-xdctools-native_3.15.01.59.bb: needs update
> recipes/ti/ti-xdctools.inc: needs update
> refusing to pull with rebase: your working tree is not up-to-date
>
> what is the correct command ?
>
> Robin
>    
>


