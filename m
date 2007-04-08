Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <tom@openhardware.net>) id 1HagIJ-0004XO-Ae
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 00:55:35 +0200
Received: (qmail 14367 invoked from network); 8 Apr 2007 22:55:34 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 8 Apr 2007 22:55:34 -0000
Message-ID: <461972D6.1060901@openhardware.net>
Date: Sun, 08 Apr 2007 18:55:18 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4611582F.8010203@openhardware.net>	<f96d234e0704050628p3f72ec6exe9ef8ea5c732d80b@mail.gmail.com>
	<c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>
In-Reply-To: <c384c5ea0704081010y623cdbafq4f9dce1148a593e5@mail.gmail.com>
Subject: Re: versioning madness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2007 22:55:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello Tom, Cliff,
>
> On 4/5/07, Cliff Brake <cliff.brake@gmail.com> wrote:
>   
>> On 4/2/07, Tom Walsh <tom@openhardware.net> wrote:
>>     
>>> I would like to know how others are handling this problem.   As you
>>> ...
>>>       
>> The solution is bbcollections.  If you set up bbcollections properly,
>> ...
>>
>>     
> I am using the same method as Cliff and this works very well for me. I
> put my private tree in a CVS repository. (But I try to commit as much
> generic stuff into mainline).
>
>   

AH!  You know, I use svn regularly and I didn't even think about using 
it against the OE tree!  Thanks, that would be the best solution for me.

I have two projects using OE, one is something that can be public, the 
other is for a client.  The svn solution should work for me well in both 
cases.

Regards,

TomW



-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




