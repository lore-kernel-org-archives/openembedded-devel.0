Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvQ0E-0000jC-3Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 10:09:18 +0100
Received: by bkwq11 with SMTP id q11so467860bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 01:01:13 -0800 (PST)
Received: by 10.204.150.69 with SMTP id x5mr371129bkv.53.1328778073747;
	Thu, 09 Feb 2012 01:01:13 -0800 (PST)
Received: from [192.168.1.2] ([79.117.107.69])
	by mx.google.com with ESMTPS id ey8sm5593429bkb.1.2012.02.09.01.01.12
	(version=SSLv3 cipher=OTHER); Thu, 09 Feb 2012 01:01:13 -0800 (PST)
Message-ID: <4F338B5A.2070106@gherzan.ro>
Date: Thu, 09 Feb 2012 11:01:14 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F33048E.8030109@palm.com>
In-Reply-To: <4F33048E.8030109@palm.com>
X-Gm-Message-State: ALoCoQn8dt/JwrpXOLDLF7zn0wx4PYyNo/EcBt+f+eShAxHdsSs2/XhzyWXVtm5s0xW/tz7RTxBx
Subject: Re: bitbake versions
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
X-List-Received-Date: Thu, 09 Feb 2012 09:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 01:26 AM, Rich Pixley wrote:
> I'm having trouble even parsing using bitbake > 1.12.
>
> Am I right in thinking that the openembedded tree isn't ready to be 
> built with bitbake > 1.12?
>
> If so, then the getting started document should probably include this 
> info. 
I just finished a core-image-minimal + some other packages using bitbake 
form git, branch master. So i don't think that there a problem with 
bitbake in your case. What error you encountered? What is your system 
shell? Hope bash.

@g


