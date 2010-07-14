Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OZ1yy-0001bS-4f
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 15:26:42 +0200
Received: (qmail 20169 invoked by uid 1003); 14 Jul 2010 13:26:36 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Jul 2010 13:26:36 -0000
Message-ID: <4C3DBB0A.6070907@balister.org>
Date: Wed, 14 Jul 2010 09:26:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279060140-17856-1-git-send-email-aalonso00@gmail.com>
	<AANLkTikVmldXgiiXObLbE5sPWAvFsfEqCuQZZzzmazBw@mail.gmail.com>
In-Reply-To: <AANLkTikVmldXgiiXObLbE5sPWAvFsfEqCuQZZzzmazBw@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3 v2] xilinx-virtex4: new file
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
X-List-Received-Date: Wed, 14 Jul 2010 13:26:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2010 03:15 AM, Frans Meulenbroeks wrote:

....

> 2010/7/14 Adrian Alonso<aalonso00@gmail.com>
>> +# Device nodes add xsa for (system ace)
>> +IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
>> +                       files/device_table_add-xsa.txt"
>>
>
> I think these are normally not put in machine files.
> (at least I normally put them in my image recipe's not in the machine file).

Just out of curiousity, what are these files for?

Philip


