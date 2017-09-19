Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 293A878075;
	Tue, 19 Sep 2017 19:14:22 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id c137so332980pga.11;
	Tue, 19 Sep 2017 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GJseXgnOumjJSVXpGOWSQiCulw5eMd5eZ49HJEmY1cI=;
	b=ugAXacKMpty2RJlm1d4y2EmxuzKuR363IQSDIQjwKdK+hiD6iOuquvxcc+YVx3jUSV
	Yk6eeWZXtc1IO7XLhb1bzQcmFF229Wg/4Kc2wAnUqPtHAfoQ60vhJDMfXTxnfo58tbfg
	7KlLMCGu/bHSa7NwL9i5SUlbF1UxYxLvODFyN70Ic4kpLxGmD2sPYZdtHd972mTDAdDz
	bxYq5rHajZVGjacXa0A0xgwnxY4OVhd3zeTzKDFyE2hjBba5G3m941SmX1lLZu9LEL5w
	UgQ73n2/MytPuKRD7tEwUv8r6hjJE9ppC4kT0Bcba62b7vIVC7mLlukphuG4c0SmsxAP
	zAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GJseXgnOumjJSVXpGOWSQiCulw5eMd5eZ49HJEmY1cI=;
	b=q72CtZHkk4quZUrHzaVjbevQLun5NoRF8vpgjVxB1LQMQ2wcjuc3jPS2vgL9QKhZ40
	zE8KB0F7liXCfkdA6P3TO1Slkufiq6cIUL0eRgJ+WCUkub0yZFdKihcs9OAWMZlRjSIJ
	hlb5xvNsdEeqKJyXI8kRdUVjoILVLzqYPsRzwBn18KF0SXrMSyF6m+sZlHI37i9k2Rmr
	8RqeT/WN5r3Ts6aLNRVY71Mj5GdQjRpk3t9gibtxpJr/sgmWkIWSjyIaAo69EhJVw8ii
	81Z3BixHWHUE927zAs3f9kyox97V4BhubI98EicAb0lYT3plO+Y5ih3IsvK/AItB0hcD
	NBwg==
X-Gm-Message-State: AHPjjUjh0zsA1MmWkf9Wc9qRKuWMEBrDHfHciuxbANChoHUwyUOE4amd
	UpivqZaFTvOMoQCO4Y17wvd9RcFxwIA849lSJ2s=
X-Google-Smtp-Source: AOwi7QDqy3ZA3kDKrZzonyvYNdhNe8RW2+7g34CeZKQq9EEKJR4SieAij3KrJzm6oOQlwDji4ZBM/PO9SlZYAVahc+Y=
X-Received: by 10.99.138.73 with SMTP id y70mr2302012pgd.317.1505848464178;
	Tue, 19 Sep 2017 12:14:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Tue, 19 Sep 2017 12:13:53 -0700 (PDT)
In-Reply-To: <CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Sep 2017 12:13:53 -0700
Message-ID: <CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 19:14:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 9:54 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Tue, Sep 19, 2017 at 11:34 AM, Sean Hudson <sean_hudson@mentor.com> wrote:
>>   Meeting information, including dial-in numbers, is on the wiki. [2]
>
> In addition to the above, we could also make use of the little-used
> #oe-meeting channel on freenode (?)

+1

I can dial in. Or someone can setup a zoom meeting

