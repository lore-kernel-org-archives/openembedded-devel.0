Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SINg0-0002s5-7M
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 19:19:20 +0200
Received: (qmail 18415 invoked by uid 1003); 12 Apr 2012 17:09:59 -0000
Received: from unknown (HELO ?192.168.1.110?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Apr 2012 17:09:58 -0000
Message-ID: <4F870C65.5030700@balister.org>
Date: Thu, 12 Apr 2012 10:09:57 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1334185891-25460-1-git-send-email-philip@balister.org>	<1334185891-25460-5-git-send-email-philip@balister.org>
	<20120412070911.GA4345@rhein.zuhause.netz>
In-Reply-To: <20120412070911.GA4345@rhein.zuhause.netz>
X-Enigmail-Version: 1.1.2
Subject: Re: [meta-oe 4/5] gnuradio : Update to version 3.5.3.
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
X-List-Received-Date: Thu, 12 Apr 2012 17:19:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/12/2012 12:09 AM, Henning Heinold wrote:
> On Wed, Apr 11, 2012 at 04:11:30PM -0700, philip@balister.org wrote:
> 
> Hi Philip,
> 
>> +#do_configure_append() {
>> +#	find ${S} -name Makefile | xargs sed -i s:'-I${STAGING_INCDIR_NATIVE'::g
>> +#	find ${S} -name Makefile | xargs sed -i s:'-L${STAGING_LIBDIR_NATIVE'::g
>> +#}
> 
> is this a left over or actual needed?

Left over. I'll kill them next time I update the recipe.

Philip


