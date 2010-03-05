Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NnRzL-0000Vu-N2
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 08:30:28 +0100
Received: (qmail 2642 invoked by uid 1003); 5 Mar 2010 07:27:29 -0000
Received: from localhost (HELO ?192.168.0.96?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 Mar 2010 07:27:29 -0000
Message-ID: <4B90B25D.6050609@balister.org>
Date: Fri, 05 Mar 2010 08:27:25 +0100
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <40d782961002250808h3faf16e4yc36e8e36199af1c1@mail.gmail.com>
In-Reply-To: <40d782961002250808h3faf16e4yc36e8e36199af1c1@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][omniorb]
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
X-List-Received-Date: Fri, 05 Mar 2010 07:30:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/25/2010 05:08 PM, majo huber wrote:
> Hi@all,
>
> The attached files are a newer recipie for omniorb (4.1.4 instead of 4.0.7).
> I'd kinly request if someone could push it to the dev branch.

OK, I've pushed this. I know the recipe needs converting to 
BBCLASSEXTEND. When I have some time, I'll look into it. The -native 
recipe is really more of a cross recipe since the only thing really 
needed is an idl compiler that runs on the build machine to convert idl 
files to c++ files.

Philip


>
> Thanks in advance,
> majo
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


