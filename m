Return-Path: <prvs=736b72a50=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id EAA5871633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:20:09 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtQMAAG9MFasEApK/2dsb2JhbABEGoQKbwa6bYYJI4V4AoIKAQEBAQEBgQtBAQEBBgYEg2IBAQR4EQsNCwkWDwkDAgECAUUGDQYCAogxCDvEbwEBAQcCIYJShCWEfoROSReEFwWWPYUciWFIhngXijSIUIMngUFxAYIIboE/QYEGAQEB
X-IPAS-Result: AtQMAAG9MFasEApK/2dsb2JhbABEGoQKbwa6bYYJI4V4AoIKAQEBAQEBgQtBAQEBBgYEg2IBAQR4EQsNCwkWDwkDAgECAUUGDQYCAogxCDvEbwEBAQcCIYJShCWEfoROSReEFwWWPYUciWFIhngXijSIUIMngUFxAYIIboE/QYEGAQEB
Message-ID: <5630BD21.3030706@skidata.com>
Date: Wed, 28 Oct 2015 13:18:41 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1446034039-1169-1-git-send-email-richard.leitner@skidata.com>
	<CAP9ODKrfx4_LaXuKeALknjz8Te-AXfER+7OQTLe_U5J2GJi-7Q@mail.gmail.com>
In-Reply-To: <CAP9ODKrfx4_LaXuKeALknjz8Te-AXfER+7OQTLe_U5J2GJi-7Q@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH v2] openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 12:20:12 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/28/2015 01:15 PM, Otavio Salvador wrote:
> On Wed, Oct 28, 2015 at 10:07 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
>> updates. For more details see:
>> http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/
>>
>> Furthermore the patches directory for OpenJDK-7 was renamed to avoid the version number.
>> This makes it easier for upgrades and to see diff's between patches.
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> While on that, would you mind to remove the preferred version from
> README? As we just offer one now, it seems not required.
> 

That's fine for me.
Should I add it to this patch or the previous one?
Or should I create a separate patch for it?

