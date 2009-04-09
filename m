Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1LrvsI-0008BO-Ut
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2009 17:09:16 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP
	id D55411AB29; Thu,  9 Apr 2009 08:05:53 -0700 (PDT)
Message-Id: <D9C7EB27-7F9F-4460-B5FA-14961A8318E9@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <87hc0y0zgo.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Thu, 9 Apr 2009 08:05:51 -0700
References: <1239209556-847-1-git-send-email-clarson@mvista.com>
	<87prfn12oj.fsf@neumann.lab.ossystems.com.br>
	<20090408184641.GB14502@denix.org>
	<87hc0y0zgo.fsf@neumann.lab.ossystems.com.br>
X-Mailer: Apple Mail (2.930.3)
X-SA-Exim-Connect-IP: 63.81.120.158
X-SA-Exim-Mail-From: clarson@mvista.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] First pass of cleanup of messages outputted to	the user.
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
X-List-Received-Date: Thu, 09 Apr 2009 15:09:16 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


On Apr 9, 2009, at 5:43 AM, Otavio Salvador wrote:

> Denys Dmytriyenko <denis@denix.org> writes:
>
>> On Wed, Apr 08, 2009 at 02:21:48PM -0300, Otavio Salvador wrote:
>>> Chris Larson <clarson@mvista.com> writes:
>>>
>>>> OpenEmbedded outputs a lot of messages that the user is likely to  
>>>> never
>>>> care about.  We should only output something when it reflects  
>>>> upon their
>>>> recipe (i.e. unpacking their sources, applying their patches), or  
>>>> is quite
>>>> significant or unusual.
>>>>
>>>> Signed-off-by: Chris Larson <clarson@mvista.com>
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> Did you mean Acked-by? :)
>
> No, since I'm not a core developer :-)

Signed-off-by is generally used by those involved in the development  
of the patch, or those through whom the patch has gone in its path  
upstream, i.e. when it goes through a gatekeeper, afaik.  I doubt  
Acked-by is limited to the core devs.. but I'm talking from a general  
sign off usage perspective here, not the OE specific usage of it.  
*shrug*
-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com


