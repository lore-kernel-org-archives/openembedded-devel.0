Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N2OeY-0007em-UZ
	for openembedded-devel@openembedded.org; Mon, 26 Oct 2009 13:26:30 +0100
Received: (qmail 10269 invoked by uid 1003); 26 Oct 2009 12:25:19 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 26 Oct 2009 12:25:19 -0000
Message-ID: <4AE5952E.7060601@balister.org>
Date: Mon, 26 Oct 2009 08:25:18 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
	<ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
In-Reply-To: <ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [help] openembedded tarball sources on HTTP
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
X-List-Received-Date: Mon, 26 Oct 2009 12:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2009 06:25 AM, RK Raggit wrote:
> anyone with some idea on this .. ? sorry for pushing , but i am kind of
> evaluating OE and would like to know whether this is possible at all ?
>
> ...unblocking cvs,svn ports is defnitely not an option for me.

One possible business associated with OE would be maintaining a server 
accessible via http that collected all the needed sources and mae them 
available to people with difficult firewall situations. I'm not sure how 
to market such a thing though.

Philip

>
> --RK
>
> On Fri, Oct 23, 2009 at 4:51 PM, RK Raggit<rk.raggit@gmail.com>  wrote:
>
>> Hi there,
>>
>> I am building openembedded recipes but i am behind a proxy that only allows
>> http accesses and blocks cvs,svn ports.
>>
>> I would like to know where i can obtain pristine OE package (tarball)
>> sources from a HTTP link. I tried
>>
>> http://oesources.org/source/current
>>
>> ...but that link does not work. Could someone please guide me the correct
>> link ? I will update my CVS_TARBALL_STASH
>> variable with this link.
>>
>> Thanks
>> RK
>>
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


