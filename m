Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Pfdwr-0006Uf-HV
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 20:44:07 +0100
Received: (qmail 32555 invoked by uid 1003); 19 Jan 2011 19:43:18 -0000
Received: from unknown (HELO ?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Jan 2011 19:43:18 -0000
Message-ID: <4D373EDB.1070200@balister.org>
Date: Wed, 19 Jan 2011 11:43:23 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D36F9BE.1010601@xora.org.uk>
In-Reply-To: <4D36F9BE.1010601@xora.org.uk>
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Wed, 19 Jan 2011 19:44:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2011 06:48 AM, Graeme Gregory wrote:
> Hi, this email is sent as an ordinary member of OE.
>
> It seems to be on a technical level we are agreed that we should split
> parts of OE out into the so called openembedded-core which will have a
> stricter commit access and higher QA requirements on changes.
>
> I therefore think it is time to actually create the repository and let
> the people who are interested in merging the good stuff from poky with
> the good stuff from openembedded to create our "core". I don't think
> there is any need to wait on the political part of the Yocto/OE
> collaboration as its something we have agreed in principal to do anyway.
>
> I would request then that the TSC drive this forward with the server
> admins and create this repo so work can happen.

We should also have some discussion on the process for getting stuff 
into -core and how devs get commit access. Basically, we need to think 
about how to integrate the OpenEmbedded people and the Yocto people.

Philip


